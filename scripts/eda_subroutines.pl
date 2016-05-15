use strict;
#####################################################################
#Copyright : Copyright (C) 2016 Parallella Foundation
#License   : MIT
#Author    : Andreas Olofsson
#####################################################################
#####################################################################
# LIBRARY STRUCTURE:
#
# $libhash{name}
# $libhash{date}
# $libhash{rev}
# $libhash{license}
#
#####################################################################
# MODULE STRUCTURE:
#
# $modhash{name}
# $modhash{current}
# $modhash{area}
#
#####################################################################
# SIGNAL STRUCTURE:
#
# $sighash{$sig}{name}
# $sighash{$sig}{dir}
# $sighash{$sig}{end}
# $sighash{$sig}{start}
# $sighash{$sig}{max}
# $sighash{$sig}{min}
# $sighash{$sig}{type}
# $sighash{$sig}{clk}
# $sighash{$sig}{cap}
#
####################################################################

####################################################################
# Removes comments from a verilog file
####################################################################
sub vlog_rm_comments{
    my $input  = $_[0];
    my $output = $_[1];    
    my $comment=0;
    my $code;
    my $CheckComment;
    my $RunningComment;
    my @list;

    open(FILE,"$input") || die "Cannot open $input for reading: $!\n";
    open(FILEOUT,">$output") || die "Cannot open $output for reading: $!\n";
    
    while(<FILE>){      
        $CheckComment=1;
	$RunningComment=0;
	if(/(.*?)\/\/(.*)$/){
            $code=$1;
	    if((!$RunningComment)){
		$_=$code;
	    }
	}	
	#DELETING RUNNING COMMENT
	if((/(.*?)\*\/(.*)/) & ($RunningComment)){
	    $_=$1;
	    $RunningComment=0;
	}
        #REMOVING SAME LINE COMMENTS
        while($CheckComment){
            s/\/\*.*?\*\///;
            if(/\/\*.*?\*\//){  
                $CheckComment=1;
            }
            else{
                $CheckComment=0;   
            }   	    
        }	
        #REMOVING MULTI LINE COMMENTS
        if(/(.*?)\/\*/){
            $code=$1;
            $comment=1;
            $_=$code;
        }
        elsif(/.*?\*\/(.*?)/){
            $code=$1;       
            $comment=0;
            $_=$code;
        }               
	if(!$comment){
	    print FILEOUT "$_\n";
	}
    }
    close(FILE);
    close(FILEOUT);
}
############################################################################
# Creates a hash of signals based on ports of a Verilog module
############################################################################
sub vlog_get_ports{
    my $file = $_[0];
    my $line;
    my $sig;
    my $module;
    my $interface;
    my @list;
    my $dir;
    my $bus;
    my $name;
    my $start;
    my $end;
    my %signal;
    #Getting ports
    open (INFILE,"$file") || die "ERROR:Couldn't open $file\n $!";   
    while (<INFILE>) {      
	# Using ";" as statement parser
	if (!(/\;/)){
	    chomp($_);
	    $line=$line.$_;	     
	}
	else {
	    $_=$line.$_;
	    chomp($_);    
	    #get module interface
	    if (/^\s*module\s+(\w+)\s*\((.*)\)\;/) {
		$module=$1;
		$interface=$2;
		@list=split('\,',$interface);
		foreach $sig (@list) {
		    if($sig=~ /\s*(\w+)(.*?)(\w+)\s*$/){
			$dir=$1;
			$bus=$2;
			$name=$3;
			if($bus=~ /\[(\d+)\:(\d+)]/){
			    $end=$1;
			    $start=$2;
			}
			$signal{$name}{dir}=$dir;
			$signal{$name}{start}=$start;
			$signal{$name}{end}=$end;
			$signal{$name}{cap}=0.0;
		    }
		}
	    }
	}
    }
    close (INFILE);
    return (\%signal,$module);
}
############################################################################
# Creates a basic legal liberty model
############################################################################
sub liberty_create {
    my $libref   = $_[0];  # library hash referece
    my $cellref  = $_[1];  # cell hash reference
    my $sigref   = $_[2];  # signal hash reference

    my %libhash;
    my %cellhash;
    my %sighash;
    my $sig;
    my $width;

    #dereference
    %libhash=%$libref;
    %cellhash=%$cellref;
    %sighash=%$sigref;

    ##print out header
    &liberty_header ($libref);

    ##create all buses
    foreach $sig (keys %sighash) {
	if($sighash{$sig}{end}>0){
            $width = $sighash{$sig}{end} - $sighash{$sig}{start} + 1;
	    print "    type (${sig}_bus_$sighash{$sig}{end}_to_$sighash{$sig}{start}) {\n";
	    print "        base_type : array ;\n";
	    print "        data_type : bit ;\n";
	    print "        bit_width : $width  ;\n";
	    print "        bit_from  : $sighash{$sig}{end} ;\n";
	    print "        bit_to    : $sighash{$sig}{start} ;\n";
	    print "        downto : true ;\n";
	    print "    }\n";
	}
    }
    
    ##create cell properties
    print "    cell ($cellhash{name}) {\n";
    print "        area                     : $cellhash{area} ;\n";
    print "        interface_timing         : TRUE ;\n";
    print "        dont_use                 : TRUE ;\n";
    print "        dont_touch               : TRUE ;\n";
    print "        map_only                 : TRUE ;\n";
    print "        is_macro_cell            : TRUE ;\n";
    
    ## Create all pins
    foreach $sig (keys %sighash) {
	#TODO:make choice
	if($sighash{$sig}{end} > 0) {
	    print "        bus ($sig) {\n";
	    print "	       bus_type    : ${sig}_bus_$sighash{$sig}{end}_to_$sighash{$sig}{start} ;\n";
	}
	else {
	    print "        pin ($sig) {\n";
	}
	print "	       direction   : $sighash{$sig}{dir};\n";
	print "	       capacitance : $sighash{$sig}{cap};\n";
	print "        }\n";
    }
    ## Close cell/lib
    print "     }\n";
    print "}\n";
}
 
############################################################################
# Prints out a Liberty format library header
# Hardcoded values: 10/90 threshold
# Units: V,uA,ns,uW,kohm  
############################################################################
sub liberty_header {
    my $libref  = $_[0];
    my %libhash;
    %libhash=%$libref;

    print "    
library    ($libhash{name}) {
    technology (cmos) ;
    date                          : \"$libhash{date}\" ;
    comment                       : \"$libhash{license}\" ;
    revision                      : \"$libhash{rev}\" ;
    delay_model                   : table_lookup ;
    simulation                    : true ;
    nom_process                   : 1 ;
    nom_temperature               : $libhash{temp} ;
    nom_voltage                   : $libhash{volt} ;
    operating_conditions ( \"$libhash{corner}\" ) {
        process : 1 ;
        temperature : $libhash{temp} ;
        voltage : $libhash{volt} ;
        tree_type : \"balanced_tree\" ;
    }
    default_operating_conditions : $libhash{corner} ;
    capacitive_load_unit ( 1, pf) ;
    voltage_unit                  : \"1V\" ;
    current_unit                  : \"1uA\" ;
    time_unit                     : \"1ns\" ;
    leakage_power_unit            : \"1uW\" ;   
    pulling_resistance_unit       : \"1kohm\" ;      
    default_max_fanout            : 20.0 ;
    default_fanout_load           : 1.0 ;
    default_inout_pin_cap         : 0.0 ;
    default_input_pin_cap         : 0.0 ;
    default_output_pin_cap        : 0.0 ;
    slew_lower_threshold_pct_rise : 10.00 ;
    slew_upper_threshold_pct_rise : 90.00 ;
    slew_derate_from_library      : 1.00 ;
    input_threshold_pct_fall      : 50.00 ;
    output_threshold_pct_fall     : 50.00 ;
    input_threshold_pct_rise      : 50.00 ;
    output_threshold_pct_rise     : 50.00 ;
    slew_lower_threshold_pct_fall : 10.00 ;
    slew_upper_threshold_pct_fall : 90.00 ;
";
}
############################################################################
1;

