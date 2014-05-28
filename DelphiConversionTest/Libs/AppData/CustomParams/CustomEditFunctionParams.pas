{ ------------------------------------------------------------------------------------------------------------
  Copyright � 2011 Zinsser Analytic GmbH - All rights reserved.
  Author       : Wolfgang Lyncke (wl)
  Description  : Klassen, die von TCustomSettingEditFunctionParams abgeleitet wurden
  ------------------------------------------------------------------------------------------------------------
  Revision History:
  date     op  method                                    track-no  improvement/change
  -------- --  ---------------------------------------  --------  --------------------------------------------
  07.02.11 wl                                            TN5460   initial version
  14.02.11 wl  TRackDoublePosEditFunctionParams          TN5468   neu: fEditTitlef�r Source, Dest, Diluent positions
  08.07.11 wl  TSingleRackPosArrayEditFunctionParams     TN5626   neu, f�r: XYMovement, Aspirate, Dispense, Pipette (New)
  01.03.13 wl  TRackPosArrayEditFunctionParams           TN6101   erweitert auf RackName-Array
  05.03.13 wl  TReferringToRackPosArrayEditFunctionParams TN6101   neu
  ------------------------------------------------------------------------------------------------------------ }

unit CustomEditFunctionParams;


interface


uses
    CustomSetting;

type
    // allgemein f�r einen Parameter:
    TSingleValueEditFunctionParams = class(TCustomSettingEditFunctionParams)
    private
        function GetSingleParam: TCustomSettingEditFunctionParam;
    public
        constructor Create(const aStoreKeyNamesParam: TCustomSetting);
        property SingleParam: TCustomSettingEditFunctionParam read GetSingleParam;
    end;

    // spezielle EditFunctionParams:
    TMethodParamsEditFunctionParams = class(TCustomSettingEditFunctionParams)
    private
        function GetMethodNameParam: TCustomSettingEditFunctionParam;
        function GetMethodParamsParam: TCustomSettingEditFunctionParam;
    public
        constructor Create(const aMethodNameParam, aMethodParamsParam: TCustomSetting);
        property MethodNameParam: TCustomSettingEditFunctionParam read GetMethodNameParam;
        property MethodParamsParam: TCustomSettingEditFunctionParam read GetMethodParamsParam;
    end;

    TPipDeviceAndUsedtipsEditFunctionParams = class(TCustomSettingEditFunctionParams)
    private
        function GetPipDeviceName: TCustomSettingEditFunctionParam;
        function GetUsedTips: TCustomSettingEditFunctionParam;
    public
        constructor Create(const aPipDeviceName, aUsedTips: TCustomSetting);
        property PipDeviceName: TCustomSettingEditFunctionParam read GetPipDeviceName;
        property UsedTips: TCustomSettingEditFunctionParam read GetUsedTips;
    end;

    TRackEditFunctionParams = class(TCustomSettingEditFunctionParams)
    private
        function GetRackName: TCustomSettingEditFunctionParam;
    public
        constructor Create(const aRackNameParam: TCustomSetting);
        property RackName: TCustomSettingEditFunctionParam read GetRackName;
    end;

    TRackDoublePosEditFunctionParams = class(TCustomSettingEditFunctionParams)
    private
        fEditTitle: string;
        function GetRackName: TCustomSettingEditFunctionParam;
        function GetFirstPos: TCustomSettingEditFunctionParam;
        function GetLastPos: TCustomSettingEditFunctionParam;
    public
        constructor Create(const aRackNameParam, aFirstPosParam, aLastPosParam: TCustomSetting;
            const aTitle: string);
        property RackName: TCustomSettingEditFunctionParam read GetRackName;
        property FirstPos: TCustomSettingEditFunctionParam read GetFirstPos;
        property LastPos: TCustomSettingEditFunctionParam read GetLastPos;
        property EditTitle: string read fEditTitle;
    end;

    TRackSinglePosEditFunctionParams = class(TCustomSettingEditFunctionParams)
    private
        fEditTitle: string;
        function GetRackName: TCustomSettingEditFunctionParam;
        function GetPos: TCustomSettingEditFunctionParam;
    public
        constructor Create(const aRackNameParam, aPosParam: TCustomSetting; const aTitle: string);
        property RackName: TCustomSettingEditFunctionParam read GetRackName;
        property Pos: TCustomSettingEditFunctionParam read GetPos;
        property EditTitle: string read fEditTitle;
    end;

    TRackPosArrayEditFunctionParams = class(TCustomSettingEditFunctionParams)
    private
        fEditTitle: string;
        function GetRackNames: TCustomSettingEditFunctionParam;
        function GetPositions: TCustomSettingEditFunctionParam;
    public
        constructor Create(const aRackNameParam, aPosParam: TCustomSetting; const aTitle: string);
        property RackNames: TCustomSettingEditFunctionParam read GetRackNames;
        property Positions: TCustomSettingEditFunctionParam read GetPositions;
        property EditTitle: string read fEditTitle;
    end;

    TReferringToRackPosArrayEditFunctionParams = class(TCustomSettingEditFunctionParams)
    private
        fEditTitle: string;
        fRackPosAtIndex: integer;
        function GetRackNames: TCustomSettingEditFunctionParam;
        function GetPositions: TCustomSettingEditFunctionParam;
        function GetParamValueAt(aIndex: integer): TCustomSettingEditFunctionParam;
        function GetVarParamCount: integer;
    public
        constructor Create(const aParams: TArray<TCustomSetting>;
            const aRackNameParam, aPosParam: TCustomSetting; const aTitle: string; aRackPosAtIndex: integer);
        property this[aIndex: integer]: TCustomSettingEditFunctionParam read GetParamValueAt; default;
        property Count: integer read GetVarParamCount;
        property RackNames: TCustomSettingEditFunctionParam read GetRackNames;
        property Positions: TCustomSettingEditFunctionParam read GetPositions;
        property EditTitle: string read fEditTitle;
        property RackPosAtIndex: integer read fRackPosAtIndex;
    end;

    TSlotStructEditFunctionParams = class(TCustomSettingEditFunctionParams)
    private
        function GetCarrierName: TCustomSettingEditFunctionParam;
        function GetSlot: TCustomSettingEditFunctionParam;
    public
        constructor Create(const aCarrierNameParam, aSlotParam: TCustomSetting);
        property CarrierName: TCustomSettingEditFunctionParam read GetCarrierName;
        property Slot: TCustomSettingEditFunctionParam read GetSlot;
    end;

    TSQLArgsEditFunctionParams = class(TCustomSettingEditFunctionParams)
    private
        function GetTermNameParam: TCustomSettingEditFunctionParam;
        function GetArgsParam: TCustomSettingEditFunctionParam;
    public
        constructor Create(const aTermNameParam, aArgsParam: TCustomSetting);
        property TermNameParam: TCustomSettingEditFunctionParam read GetTermNameParam;
        property ArgsParam: TCustomSettingEditFunctionParam read GetArgsParam;
    end;


implementation


{ TSingleValueEditFunctionParams }

constructor TSingleValueEditFunctionParams.Create(const aStoreKeyNamesParam: TCustomSetting);
begin
    inherited Create();
    self.AddEditFuncParam(aStoreKeyNamesParam, false);
end;

function TSingleValueEditFunctionParams.GetSingleParam: TCustomSettingEditFunctionParam;
begin
    result := fList[0];
end;

{ TMethodParamsEditFunctionParams }

constructor TMethodParamsEditFunctionParams.Create(const aMethodNameParam, aMethodParamsParam
    : TCustomSetting);
begin
    inherited Create();
    self.AddEditFuncParam(aMethodNameParam, true);
    self.AddEditFuncParam(aMethodParamsParam, false);
end;

function TMethodParamsEditFunctionParams.GetMethodNameParam: TCustomSettingEditFunctionParam;
begin
    result := fList[0];
end;

function TMethodParamsEditFunctionParams.GetMethodParamsParam: TCustomSettingEditFunctionParam;
begin
    result := fList[1];
end;

{ TPipDeviceAndUsedtipsEditFunctionParams }

constructor TPipDeviceAndUsedtipsEditFunctionParams.Create(const aPipDeviceName, aUsedTips: TCustomSetting);
begin
    inherited Create();
    self.AddEditFuncParam(aPipDeviceName, true);
    self.AddEditFuncParam(aUsedTips, false);
end;

function TPipDeviceAndUsedtipsEditFunctionParams.GetPipDeviceName: TCustomSettingEditFunctionParam;
begin
    result := fList[0];
end;

function TPipDeviceAndUsedtipsEditFunctionParams.GetUsedTips: TCustomSettingEditFunctionParam;
begin
    result := fList[1];
end;

{ TRackEditFunctionParams }

constructor TRackEditFunctionParams.Create(const aRackNameParam: TCustomSetting);
begin
    inherited Create();
    self.AddEditFuncParam(aRackNameParam, false);
end;

function TRackEditFunctionParams.GetRackName: TCustomSettingEditFunctionParam;
begin
    result := fList[0];
end;

{ TRackDoublePosEditFunctionParams }

constructor TRackDoublePosEditFunctionParams.Create(const aRackNameParam, aFirstPosParam,
    aLastPosParam: TCustomSetting; const aTitle: string);
begin
    inherited Create();
    fEditTitle := aTitle;
    self.AddEditFuncParam(aRackNameParam, false);
    self.AddEditFuncParam(aFirstPosParam, false);
    self.AddEditFuncParam(aLastPosParam, false);
end;

function TRackDoublePosEditFunctionParams.GetRackName: TCustomSettingEditFunctionParam;
begin
    result := fList[0];
end;

function TRackDoublePosEditFunctionParams.GetFirstPos: TCustomSettingEditFunctionParam;
begin
    result := fList[1];
end;

function TRackDoublePosEditFunctionParams.GetLastPos: TCustomSettingEditFunctionParam;
begin
    result := fList[2];
end;

{ TRackSinglePosEditFunctionParams }

constructor TRackSinglePosEditFunctionParams.Create(const aRackNameParam, aPosParam: TCustomSetting;
    const aTitle: string);
begin
    inherited Create();
    fEditTitle := aTitle;
    self.AddEditFuncParam(aRackNameParam, false);
    self.AddEditFuncParam(aPosParam, false);
end;

function TRackSinglePosEditFunctionParams.GetRackName: TCustomSettingEditFunctionParam;
begin
    result := fList[0];
end;

function TRackSinglePosEditFunctionParams.GetPos: TCustomSettingEditFunctionParam;
begin
    result := fList[1];
end;

{ TRackSinglePosEditFunctionParams }

constructor TRackPosArrayEditFunctionParams.Create(const aRackNameParam, aPosParam: TCustomSetting;
    const aTitle: string);
begin
    inherited Create();
    fEditTitle := aTitle;
    self.AddEditFuncParam(aRackNameParam, false);
    self.AddEditFuncParam(aPosParam, false);
end;

function TRackPosArrayEditFunctionParams.GetRackNames: TCustomSettingEditFunctionParam;
begin
    result := fList[0];
end;

function TRackPosArrayEditFunctionParams.GetPositions: TCustomSettingEditFunctionParam;
begin
    result := fList[1];
end;

{ TSlotStructEditFunctionParams }

constructor TSlotStructEditFunctionParams.Create(const aCarrierNameParam, aSlotParam: TCustomSetting);
begin
    inherited Create();
    self.AddEditFuncParam(aCarrierNameParam, false);
    self.AddEditFuncParam(aSlotParam, false);
end;

function TSlotStructEditFunctionParams.GetCarrierName: TCustomSettingEditFunctionParam;
begin
    result := fList[0];
end;

function TSlotStructEditFunctionParams.GetSlot: TCustomSettingEditFunctionParam;
begin
    result := fList[1];
end;

{ TSQLArgsEditFunctionParams }

constructor TSQLArgsEditFunctionParams.Create(const aTermNameParam, aArgsParam: TCustomSetting);
begin
    inherited Create();
    self.AddEditFuncParam(aTermNameParam, true);
    self.AddEditFuncParam(aArgsParam, false);
end;

function TSQLArgsEditFunctionParams.GetTermNameParam: TCustomSettingEditFunctionParam;
begin
    result := fList[0];
end;

function TSQLArgsEditFunctionParams.GetArgsParam: TCustomSettingEditFunctionParam;
begin
    result := fList[1];
end;

{ TReferringToRackPosArrayEditFunctionParams }

constructor TReferringToRackPosArrayEditFunctionParams.Create(const aParams: TArray<TCustomSetting>;
    const aRackNameParam, aPosParam: TCustomSetting; const aTitle: string; aRackPosAtIndex: integer);
var
    x: integer;
begin
    inherited Create();

    fEditTitle := aTitle;
    fRackPosAtIndex := aRackPosAtIndex;

    self.AddEditFuncParam(aRackNameParam, true);
    self.AddEditFuncParam(aPosParam, true);

    for x := 0 to high(aParams) do
        self.AddEditFuncParam(aParams[x], false);
end;

function TReferringToRackPosArrayEditFunctionParams.GetPositions: TCustomSettingEditFunctionParam;
begin
    EXIT(fList[1]);
end;

function TReferringToRackPosArrayEditFunctionParams.GetRackNames: TCustomSettingEditFunctionParam;
begin
    EXIT(fList[0]);
end;

function TReferringToRackPosArrayEditFunctionParams.GetVarParamCount: integer;
begin
    EXIT(fList.Count - 2)
end;

function TReferringToRackPosArrayEditFunctionParams.GetParamValueAt(aIndex: integer)
    : TCustomSettingEditFunctionParam;
begin
    EXIT(fList[aIndex + 2]);
end;


end.
