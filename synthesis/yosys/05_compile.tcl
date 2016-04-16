#COMPILE TO GATES

#always blocks
proc; opt

#fsm
fsm; opt

#memory arrays
memory;opt

# convert to gates
techmap; opt

# mapping flip-flops to mycells.lib
dfflibmap -liberty mycells.lib

# mapping logic to mycells.lib
abc -liberty mycells.lib
clean


