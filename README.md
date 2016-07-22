OpenEDA: 
=====================================

## Unix Shell Variables

| Variable          | Description                                     |
|-------------------|-------------------------------------------------|
| OH_HOME           | Path to OH repository                           |
| OPENEDA_HOME      | Path to Open EDA repository                     |
| EDA_HOME          | Path to proprietary PNR tool scripts directory  |
| PROJ_HOME         | Path to your project home directory             |
| PROCESS_HOME      | Path to foundry home directory                  |

## IP Library Setup

| Variable          | Description                                     |
|-------------------|-------------------------------------------------|
| OH_LIBS           | List of target libraries (eg stdcells.db)       |
| OH_LIBPATHS       | Search paths for target $OH_LIBS                |
| OH_LIBPHYS        | Full path to library layout(/tmp/stdcells.mw)   |
| OH_MACROLIBS      | List of macro libs (eg. /home/sram.db)          | 
| OH_MACROPHYS      | Full path to macro layout(/home/lib/sram_mw)    |
| OH_MACROPATHS     | Optional search paths for $OH_MACROLIBS         |
| OH_GDSLIBS        | List of all library GDS files                   |
| OH_LIBRULES       | Special tool specific library rules             |
| OH_CELLS_HEADER   | List of header cells to use                     |
| OH_CELLS_CLK      | List of cells to use for CTS                    |
| OH_CELLS_ICG      | List of clock gating cells                      |
| OH_CELLS_HOLD     | List of preferred hold fix cells                |
| OH_CELLS_ANT      | List of antenna cells                           |
| OH_CELLS_TIE      | List of tie cells                               |
| OH_CELLS_BOUNDARY | List of boundary cells                          |
| OH_CELLS_DCAP     | List of decoupling cap cells                    |
| OH_CELLS_FILL     | List of filler cells                            |
| OH_CELLS_ISO      | List of isolation cells                         |
| OH_CELLS_DRIVE    | Name of default driver cell for constraints     |
| OH_CELLS_PADFILL  | Name of io pad filler cells                     |
| OH_CELLS_TAP      | List of tap cells

## Layout Rules (in micron)

| Variable         | Description                                          |
|-------------------|------------------------------------------------------|
| OH_FINGRID        | Finfet grid size                                     |
| OH_M1GRID         | Metal 1 grid size                                    |
| OH_M2GRID         | Metal 2 grid size                                    |
| OH_M3GRID         | Metal 3 grid size                                    |
| OH_M4GRID         | Metal 4 grid size                                    |
| OH_M5GRID         | Metal 5 grid size                                    |
| OH_M6GRID         | Metal 6 grid size                                    |
| OH_M7GRID         | Metal 7 grid size                                    |
| OH_M8GRID         | Metal 8 grid size                                    |
| OH_M9GRID         | Metal 9 grid size                                    |
| OH_M10GRID        | Metal 10 grid size                                   |
| OH_M11GRID        | Metal 11 grid size                                   |
| OH_M12GRID        | Metal 12 grid size                                   |
| OH_M13GRID        | Metal 13 grid size                                   |
| OH_APGRID         | RDL routing grid                                     |
| OH_TAPSPACE       | Maximum distance between tap cells                   |
| OH_ROW            | Standard cell library row height (12, 9, track etc)  |

## Place and Route Tool Settings

| Variable           | Description                                          |
|--------------------|------------------------------------------------------|
| OH_VENDOR          | Vendor namr for PNR tool                             |
| OH_TECHFILE        | Place and route tool technology file                 |
| OH_TECHMAP         | Layer Map file for PNR tool                          |
| OH_GDSMAP          | Mapping file for streaming out GDS                   |
| OH_DEBUG           | Enables verbose printing                             | 
| OH_LAYER_MIN       | Minimum routing layer                                |
| OH_LAYER_MAX       | Maximum routing layer                                |
| OH_BLEEDING        | Set to "1" below 22nm                                |
| OH_THREADS         | Threads to use for PNR tool                          |
| OH_EFFORT          | Global effort setting for PNR tool                   |
| OH_REV             | Project specific revision                            |
| OH_VDD             | Global VDD net name ("vdd")                          |
| OH_VSS             | Global VSS net name ("vss")                          |
| OH_ANTCMD          | Antenna insertion command                            |
| OH_VIACMD          | Via insertion command                                |
| OH_TAPCMD          | Tap cell insertion command                           |
| OH_BOUNDARY_CMD    | Boundary cell insertion command                      |
| OH_POLYFILL_RULES  | Polyfill run set                                     |
| OH_METALFILL_RULES | Metalfill run set                                    |
| OH_LVS_RULES       | LVS signoff run set                                  |
| OH_DRC_RULES       | DRC signoff run set                                  |

## Design Settings

| Variable        | Description                                          |
|-----------------|------------------------------------------------------|
| OH_DESIGN       | Name of the design                                   |
| OH_UPF          | UPF Power Definition file                            |
| OH_CONSTRAINTS  | Synopsys Design Constraints                          |
| OH_FLOORPLAN    | Floorplan file (proprietary or DEF)                  |
| OH_POWER        | Power grid creation command file                     |
| OH_SPECIAL      | Special routing nets and ports                       |
| OH_DESIGNPATHS  | Paths to design specific .libs                       |
| OH_DESIGNPHYS   | Full paths to design layout libraries                |
| OH_DESIGNLIBS   | List of logical libraries                            |

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

## REFERENCES

http://opencircuitdesign.com/verilog
http://vlsiarch.ecen.okstate.edu/flow/
http://vlsi.colorado.edu/~vis/
http://www.eecs.berkeley.edu/~alanmi/abc/
http://www.ecs.umass.edu/ece/labs/vlsicad/ece667/links/blif.pdf
https://embedded.eecs.berkeley.edu/Alumni/pinhong/scriptEDA/
