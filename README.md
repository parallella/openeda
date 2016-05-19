OpenEDA: 
=====================================

## DESIGN API

| VARIABLE       | DESCRIPTION                                   |
|----------------|-----------------------------------------------|
| OH_DESIGN      | Top level design name                         |
| OH_DESIGNFILES | Design sources                                |
| OH_FLOORPLAN   | Physical floorplan (DEF preferred)            |
| OH_UPF         | Unified Power Format Specification            |
| OH_CONSTRAINTS | Synopsys Design Constraints                   |

## PROJECT SETTINGS

| VARIABLE       | DESCRIPTION                                   |
|----------------|-----------------------------------------------|
| OH_HOME        | Full path to OH repo                          |
| OH_PROCESS     | Full path to process node (proprietary)       |
| OH_EDA         | Full path to EDA script report (proprietary)  |
| OH_VENDOR      | EDA vendor name                               |
| OH_EFFORT      | Implementation effort (eg "high")             |
| OH_THREADS     | Number of parallel threads to use in tools    |
| OH_REV         | Revision/date stamp implementation runs       |


## PROCESS API

| VARIABLE       | DESCRIPTION                                    |
|----------------|------------------------------------------------|
| OH_TECHFILE    | Place and route technology file                |
| OH_LAYER_MIN   | Min routing layer name (eg "M2")               |
| OH_LAYER_MAX   | Max routing layer name (eg "M7")               |
| OH_RCMODEL_MIN | Min corner wiring extraction model             |
| OH_RCMODEL_MAX | Max corner wiring extraction model             |
| OH_TECHMAP     | Maps tech file layers to GDS/LEF               |
| OH_BLEEDING    | Indicates bleeding edge process node           |

## IP API 

| VARIABLE          | DESCRIPTION                                     |
|-------------------|-------------------------------------------------|
| OH_LIBS           | List of target libraries (eg stdcells.db)       |
| OH_LIBPATHS       | Search paths for target $OH_LIBS                |
| OH_LIBPHYS        | Full path to library layout(/tmp/stdcells.mw)   |
| OH_MACROLIBS      | List of macro libs (eg. /home/sram.db)          | 
| OH_MACROPHYS      | Full path to macro layout(/home/lib/sram_mw)    |
| OH_MACROPATHS     | Optional search paths for $OH_MACROLIBS         |
| OH_CELLS_DRIVE    | Name of default driver cell for constraints     |
| OH_CELLS_CLK      | List of cells to use for CTS                    |
| OH_CELLS_ICG      | List of clock gating cells                      |
| OH_CELLS_HOLD     | List of preferred hold fix cells                |
| OH_CELLS_ANT      | List of antenna cells                           |
| OH_CELLS_TIE      | List of tie cells                               |
| OH_CELLS_BOUNDARY | List of boundary cells                          |
| OH_CELLS_DCAP     | List of decoupling cap cells                    |
| OH_CELLS_FILL     | List of filler cells                            |
| OH_CELLS_ISO      | List of isolation cells                         |

## FILES

| SUFFIX         | DESCRIPTION                                     |
|----------------|-------------------------------------------------|
| .sdc           | Synopsys Design Constraints                     |
| .upf           | Unified Power Format Specification              |
| .sfp           | Synopsys Floorplan Format                       |
| .lib           | Synopsys Liberty Format (ascii)                 | 
| .db            | Synopsys Compiled Liberty format                |
| .vg            | Gate level Verilog Netlist                      |
| .v             | Verilog RTL                                     |
| .vh            | Verilog RTL Header File                         |
| .rpt           | EDA tool reports                                |

## EMACS HACK

Place the following in your ~/.emacs file to turn on syntaxi highlighting

```
(setq auto-mode-alist (cons '("\\.sfp$" . tcl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.upf$" . tcl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sdc$" . tcl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.vg$" . verilog-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.vh$" . verilog-mode) auto-mode-alist))
```

 