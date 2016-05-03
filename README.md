OpenEDA: 
=====================================

These variables represent all the informsation needed to implement a leading edge chip. The arguments will depend on actual EDA tools being used.
For exmple, some tool verilog read commands support the "-y" argument. We assume tcl script exists to drive each tool using these variables

## PROJECT SETTINGS

| VARIABLE       | DESCRIPTION                                   |
|----------------|-----------------------------------------------|
| OH_HOME        | Full path to OH repo                          |
| OH_VENDOR      | EDA vendor name                               |
| PROCESS_HOME   | Full path to process node (proprietary)       |
| EDA_HOME       | Full path to EDA script report (proprietary)  |

## DESIGN API

| VARIABLE       | DESCRIPTION                                   |
|----------------|-----------------------------------------------|
| OH_DESIGN      | Name of top level design                      |
| OH_FLOORPLAN   | Physical floorplan                            |
| OH_CONSTRAINTS | Synopsys Design Constraints                   |
| OH_VERILOGTOP  | The top verilog file                          |
| OH_VERILOGCFG  | Define variables                              |
| OH_VERILOGLIBS | All other verilog files                       |
| OH_EFFORT      | Implementation effort (eg "high")             |
| OH_THREADS     | Number of parallel threads to use in tools    |

## PROCESS API

| VARIABLE       | DESCRIPTION                                    |
|----------------|------------------------------------------------|
| OH_TECHFILE    | Place and route technology file                |
| OH_LAYER_MIN   | Min routing layer name (eg "M2")               |
| OH_LAYER_MAX   | Max routing layer name (eg "M7")               |
| OH_RCMODEL_MIN | Min corner wiring extraction model             |
| OH_RCMODEL_MAX | Max corner wiring extraction model             |
| OH_TECHMAP     | Maps tech file layers to GDS/LEF               |
| OH_BLEEDING    | 1/0: indicates bleeding edge process node      |

## IP API 

| VARIABLE       | DESCRIPTION                                    |
|----------------|------------------------------------------------|
| OH_LIBS        | List of timing libraries (eg stdcells.db)      |
| OH_LIBPATHS    | Search paths for timing $OH_LIBS               |
| OH_LIBPHYS     | Full path to library layout(/tmp/stdcells.mw)  |
| OH_MACROLIBS   | Full paths to $OH_MACROLIBS                    |
| OH_MACROPATHS  | Search paths for timing $H_MACROLIBS           |
| OH_MACROPHYS   | Full path to macro layout(/tmp/sram.mw)        |
