ThruMCTargetDesc
    Header file MUST have createThruELFObjectWriter (why?), there isn't even an implementation for Thru
    RISCV contains a target streamer, this is something we can add later
    RISCV contains InstrAnalysis, we can add this later too

ThruMCAsmInfo
    RISCV contains getExprForFDESymbol, not exactly sure what this does though
    This is important for how many parts of the assembly file are set up

ThruInstPrinter
    printOperand is based off of the ThruInstrInfo, needs to match what is called
    A good step will be to modify ThruInstrInfo.td to actually match ThruPuter


