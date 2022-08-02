//******************************************************************************
//  System      : Galileopt
//  Program     : 
//  ProgramID   : 
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//  <   >   小川(LEAD)  2012/06/05      新規作成
//
//******************************************************************************

{$IFNDEF __TableMasterH_INC__}
{$DEFINE __TableMasterH_INC__}

    // HojyoTree
    THojyoTree = Class
    private
        FMasterKbn       : Integer;
        FPatternNo       : Integer;
        FSumNCode        : Extended;
        FEntNo           : Integer;
        FBasedNCode      : Extended;
        FAddKbn          : Integer;
        FUpdDateTM       : TDateTime;
        FInsDateTM       : TDateTime;
        FUpdTantoNCode   : Extended;
    public
        property MasterKbn       : Integer read FMasterKbn write FMasterKbn;
        property PatternNo       : Integer read FPatternNo write FPatternNo;
        property SumNCode        : Extended read FSumNCode write FSumNCode;
        property EntNo           : Integer read FEntNo write FEntNo;
        property BasedNCode      : Extended read FBasedNCode write FBasedNCode;
        property AddKbn          : Integer read FAddKbn write FAddKbn;
        property UpdDateTM       : TDateTime read FUpdDateTM write FUpdDateTM;
        property InsDateTM       : TDateTime read FInsDateTM write FInsDateTM;
        property UpdTantoNCode   : Extended read FUpdTantoNCode write FUpdTantoNCode;
    end;

    // HojyoMA
    THojyoMA = Class
    private
		FMasterKbn : Integer;
		FSumKbn : Integer;
		FGCode : String;
		FRenso : String;
		FLongName : String;
		FSimpleName : String;
		FNCode : Extended;
		FBankNCode : Extended;
		FHojyoKbn1 : Integer;
		FHojyoKbn2 : Integer;
		FBunCode : Integer;
		FTStartDate : TDate;
		FTEndDate : TDate;
		FBSBumonNCode : Extended;
		FCostRate : Extended;
		FLimitSum : Extended;
		FFinishDate : TDate;
		FMoveKbn : Integer;
		FRootKbn : Integer;
		FPOutSw : Integer;
		FCRMID : Integer;
		FAddGoBumonCode1 : String;
		FAddGoBumonCode2 : String;
		FDfKeihiCode : Integer;
		FHonsitenCode : Integer;
		FYobi01 : Integer;
		FYobi02 : Integer;
		FYobi03 : Integer;
		FYobi04 : Integer;
		FYobi05 : Integer;
		FYobi06 : Integer;
		FYobi07 : Integer;
		FYobi08 : Integer;
		FYobi09 : String;
		FYobi10 : String;
		FYobi11 : String;
		FYobi12 : String;
		FBunruiNCode1 : Extended;
		FBunruiNCode2 : Extended;
		FBunruiNCode3 : Extended;
		FBunruiNCode4 : Extended;
		FBunruiNCode5 : Extended;
		FBunruiNCode6 : Extended;
		FBunruiNCode7 : Extended;
		FBunruiNCode8 : Extended;
		FBunruiNCode9 : Extended;
		FBunruiNCode10 : Extended;
		FSegNCode1 : Extended;
		FSegNCode2 : Extended;
		FSegNCode3 : Extended;
		FSegNCode4 : Extended;
		FSegNCode5 : Extended;
		FSegNCode6 : Extended;
		FSegNCode7 : Extended;
		FSegNCode8 : Extended;
		FSegNCode9 : Extended;
		FSegNCode10 : Extended;
		FVFree1 : String;
		FVFree2 : String;
		FVFree3 : String;
		FVFree4 : String;
		FVFree5 : String;
		FVFree6 : String;
		FVFree7 : String;
		FVFree8 : String;
		FVFree9 : String;
		FVFree10 : String;
		FNFree1 : Extended;
		FNFree2 : Extended;
		FNFree3 : Extended;
		FNFree4 : Extended;
		FNFree5 : Extended;
		FNFree6 : Extended;
		FNFree7 : Extended;
		FNFree8 : Extended;
		FNFree9 : Extended;
		FNFree10 : Extended;
		FDFree1 : TDateTime;
		FDFree2 : TDateTime;
		FDFree3 : TDateTime;
		FSyokuchikbn : Integer;
		FRDelKbn : Integer;
		FUpdDateTM : TDateTime;
		FInsDateTM : TDateTime;
		FUpdTantoNCode : Extended;
		FNCode2 : Extended;
		FLongNameLC1 : String;
		FSimpleNameLC1 : String;
		FFileDiv : Integer;
		FNewPage : Integer;

    public
		Property MasterKbn : Integer read FMasterKbn write FMasterKbn;
		Property SumKbn : Integer read FSumKbn write FSumKbn;
		Property GCode : String read FGCode write FGCode;
		Property Renso : String read FRenso write FRenso;
		Property LongName : String read FLongName write FLongName;
		Property SimpleName : String read FSimpleName write FSimpleName;
		Property NCode : Extended read FNCode write FNCode;
		Property BankNCode : Extended read FBankNCode write FBankNCode;
		Property HojyoKbn1 : Integer read FHojyoKbn1 write FHojyoKbn1;
		Property HojyoKbn2 : Integer read FHojyoKbn2 write FHojyoKbn2;
		Property BunCode : Integer read FBunCode write FBunCode;
		Property TStartDate : TDate read FTStartDate write FTStartDate;
		Property TEndDate : TDate read FTEndDate write FTEndDate;
		Property BSBumonNCode : Extended read FBSBumonNCode write FBSBumonNCode;
		Property CostRate : Extended  read FCostRate write FCostRate;
		Property LimitSum : Extended read FLimitSum write FLimitSum;
		Property FinishDate : TDate read FFinishDate write FFinishDate;
		Property MoveKbn : Integer read FMoveKbn write FMoveKbn;
		Property RootKbn : Integer read FRootKbn write FRootKbn;
		Property POutSw : Integer read FPOutSw write FPOutSw;
		Property CRMID : Integer read FCRMID write FCRMID;
		Property AddGoBumonCode1 : String read FAddGoBumonCode1 write FAddGoBumonCode1;
		Property AddGoBumonCode2 : String read FAddGoBumonCode2 write FAddGoBumonCode2;
		Property DfKeihiCode : Integer read FDfKeihiCode write FDfKeihiCode;
		Property HonsitenCode : Integer read FHonsitenCode write FHonsitenCode;
		Property Yobi01 : Integer read FYobi01 write FYobi01;
		Property Yobi02 : Integer read FYobi02 write FYobi02;
		Property Yobi03 : Integer read FYobi03 write FYobi03;
		Property Yobi04 : Integer read FYobi04 write FYobi04;
		Property Yobi05 : Integer read FYobi05 write FYobi05;
		Property Yobi06 : Integer read FYobi06 write FYobi06;
		Property Yobi07 : Integer read FYobi07 write FYobi07;
		Property Yobi08 : Integer read FYobi08 write FYobi08;
		Property Yobi09 : String read FYobi09 write FYobi09;
		Property Yobi10 : String read FYobi10 write FYobi10;
		Property Yobi11 : String read FYobi11 write FYobi11;
		Property Yobi12 : String read FYobi12 write FYobi12;
		Property BunruiNCode1 : Extended read FBunruiNCode1 write FBunruiNCode1;
		Property BunruiNCode2 : Extended read FBunruiNCode2 write FBunruiNCode2;
		Property BunruiNCode3 : Extended read FBunruiNCode3 write FBunruiNCode3;
		Property BunruiNCode4 : Extended read FBunruiNCode4 write FBunruiNCode4;
		Property BunruiNCode5 : Extended read FBunruiNCode5 write FBunruiNCode5;
		Property BunruiNCode6 : Extended read FBunruiNCode6 write FBunruiNCode6;
		Property BunruiNCode7 : Extended read FBunruiNCode7 write FBunruiNCode7;
		Property BunruiNCode8 : Extended read FBunruiNCode8 write FBunruiNCode8;
		Property BunruiNCode9 : Extended read FBunruiNCode9 write FBunruiNCode9;
		Property BunruiNCode10 : Extended read FBunruiNCode10 write FBunruiNCode10;
		Property SegNCode1 : Extended read FSegNCode1 write FSegNCode1;
		Property SegNCode2 : Extended read FSegNCode2 write FSegNCode2;
		Property SegNCode3 : Extended read FSegNCode3 write FSegNCode3;
		Property SegNCode4 : Extended read FSegNCode4 write FSegNCode4;
		Property SegNCode5 : Extended read FSegNCode5 write FSegNCode5;
		Property SegNCode6 : Extended read FSegNCode6 write FSegNCode6;
		Property SegNCode7 : Extended read FSegNCode7 write FSegNCode7;
		Property SegNCode8 : Extended read FSegNCode8 write FSegNCode8;
		Property SegNCode9 : Extended read FSegNCode9 write FSegNCode9;
		Property SegNCode10 : Extended read FSegNCode10 write FSegNCode10;
		Property VFree1 : String read FVFree1 write FVFree1;
		Property VFree2 : String read FVFree2 write FVFree2;
		Property VFree3 : String read FVFree3 write FVFree3;
		Property VFree4 : String read FVFree4 write FVFree4;
		Property VFree5 : String read FVFree5 write FVFree5;
		Property VFree6 : String read FVFree6 write FVFree6;
		Property VFree7 : String read FVFree7 write FVFree7;
		Property VFree8 : String read FVFree8 write FVFree8;
		Property VFree9 : String read FVFree9 write FVFree9;
		Property VFree10 : String read FVFree10 write FVFree10;
		Property NFree1 : Extended read FNFree1 write FNFree1;
		Property NFree2 : Extended read FNFree2 write FNFree2;
		Property NFree3 : Extended read FNFree3 write FNFree3;
		Property NFree4 : Extended read FNFree4 write FNFree4;
		Property NFree5 : Extended read FNFree5 write FNFree5;
		Property NFree6 : Extended read FNFree6 write FNFree6;
		Property NFree7 : Extended read FNFree7 write FNFree7;
		Property NFree8 : Extended read FNFree8 write FNFree8;
		Property NFree9 : Extended read FNFree9 write FNFree9;
		Property NFree10 : Extended read FNFree10 write FNFree10;
		Property DFree1 : TDateTime read FDFree1 write FDFree1;
		Property DFree2 : TDateTime read FDFree2 write FDFree2;
		Property DFree3 : TDateTime read FDFree3 write FDFree3;
		Property Syokuchikbn : Integer read FSyokuchikbn write FSyokuchikbn;
		Property RDelKbn : Integer read FRDelKbn write FRDelKbn;
		Property UpdDateTM : TDateTime read FUpdDateTM write FUpdDateTM;
		Property InsDateTM : TDateTime read FInsDateTM write FInsDateTM;
		Property UpdTantoNCode : Extended read FUpdTantoNCode write FUpdTantoNCode;
		Property NCode2 : Extended read FNCode2 write FNCode2;
		Property LongNameLC1 : String read FLongNameLC1 write FLongNameLC1;
		Property SimpleNameLC1 : String read FSimpleNameLC1 write FSimpleNameLC1;
		Property FileDiv : Integer read FFileDiv write FFileDiv;
		Property NewPage : Integer read FNewPage write FNewPage;
    end;
    
    // MFusenInfo
    TMFusenInfo = Class
    Private
    	FMasterKbn		: Integer;
    	FNCode			: Extended;
    	FSubNCode		: Extended;
    	FFusenKbn		: Integer;
    	FFusenCmnt		: string;
    public
    	class function CreateFusenInfo(): TMFusenInfo;overload;
        class function CreateFusenInfo(Qry : TMQuery; pMasterKbn : integer; pNCode : Extended; pSubNCode : Extended; pFusenKbn : integer) : TMFusenInfo; overload;
    	property MasterKbn       : Integer read FMasterKbn write FMasterKbn;
    	property NCode       : Extended read FNCode write FNCode;
    	property SubNCode       : Extended read FSubNCode write FSubNCode;
    	property FusenKbn       : Integer read FFusenKbn write FFusenKbn;
    	property FusenCmnt       : string read FFusenCmnt write FFusenCmnt;
    end;

{$ENDIF}	// __TableMasterH_INC__
