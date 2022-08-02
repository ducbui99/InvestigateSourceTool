//******************************************************************************
//		System		:MJSLINK給与大将
//		Program		:社員登録
//		ProgramID	:HAP100010
//		UnitID		:HAP100010DialogU
//		Name		:T.Aoki
//		Create		:00/12/13
//		Comment		:
//		History		:04/12/01(T.Aoki)
//					:MjsFontResize()追加
//					:04/12/22(H.Itahana)
//					:高解像度対応<DSP>
//					:05/05/06(H.Itahana Buntechno)
//					:NSP→HAPに移行
//					:2014/07/30	T.Shinoda(Lab)
//					:拡大率対応(<NEWPRO>の箇所削除)								<MLXDSP>
//******************************************************************************
//
//				解像度対応されていないMjsCommonに対応してある。
//				MjsCommonが対応された場合には
//				<NEWPRO>の箇所を削除すること。
//
//******************************************************************************
unit HAP000010DialogU;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  HAP000010BaseU, VCL.StdCtrls, Buttons, MJSBitBtn, MJSCheckBox, MJSLabel,
  VCL.ExtCtrls, MJSSpeedButton, MJSPanel, MjsKeyDataState;

type
  {$I ActionInterface.inc}
  THAP000010DialogF = class(TForm)
	MCheckBox1: TMCheckBox;
	MCheckBox2: TMCheckBox;
	MCheckBox3: TMCheckBox;
	MCheckBox4: TMCheckBox;
	MCheckBox5: TMCheckBox;
	MCheckBox6: TMCheckBox;
	BOk: TMBitBtn;
	BCancel: TMBitBtn;
	MPanel1: TMPanel;
	BAllOn: TMSpeedButton;
	BAllOff: TMSpeedButton;
	procedure FormKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure BOkClick(Sender: TObject);
	procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
	procedure FormDestroy(Sender: TObject);
	procedure FormShow(Sender: TObject);
	procedure FormCreate(Sender: TObject);
	procedure BCancelClick(Sender: TObject);
	procedure fnCheckBoxClick(Sender: TObject);
	procedure BAllOnClick(Sender: TObject);
  private
	{ Private 宣言 }
	pAppRec:^TMjsAppRecord;
	arrChkBox:array of TMCheckBox;
  public
	{ Public 宣言 }
	procedure Init(arrChildInfo:array of TChildInfo);
	procedure Term(var arrChildInfo:array of TChildInfo);
	constructor CreateForm(pRec: Pointer; COwner: TComponent);
  protected
	procedure CMChildKey(var Msg:TWMKey);message CM_ChildKey;
  end;

{var
  HAP100010DialogF: THAP100010DialogF;}

implementation

uses
  MjsCommonU, MjsDispCtrl,
  MjsCommon2U;

const
	_BASE_LEFT_	=68;
	_BASE_TOP_	=30;

{$R *.DFM}

//**********************************************************************
//		Component	:Form
//		Event		:ｺﾝｽﾄﾗｸﾀ
//		Proccess	:
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
constructor	THAP000010DialogF.CreateForm(pRec:Pointer;cOwner:TComponent);
begin
	pAppRec:=pRec;
	inherited Create(cOwner);
end;

//**********************************************************************
//		Component	:Form
//		Event		:KeyDown
//		Proccess	:ﾌｫｰﾑ ｷｰ押下
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010DialogF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{
	case Key of
		VK_ESCAPE:
			Close;
		VK_RETURN,
		VK_RIGHT,
		VK_DOWN:
		begin
			if(Key=VK_RETURN)and(Sender=BOk)then
			begin
				MjsNextCtrl(Self);
				Key:=0;
				Abort;
			end;
		end;
		VK_UP,
		VK_LEFT:
		begin
			MjsPrevCtrl(Self);
			Key:=0;
			Abort;
		end;
	end;
}
end;

//**********************************************************************
//		Component	:Form
//		Event		:CloseQuery
//		Proccess	:ﾌｫｰﾑ 終了確認
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010DialogF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
{var
	i:integer;
	Flg:boolean;}
begin
{
	Flg:=FALSE;
	for i:=0 to Length(arrChkBox)-1 do
	begin
		if (arrChkBox[i] as TMCheckBox).Checked then
			Flg:=TRUE;
	end;

	CanClose:=Flg;
}
end;

//**********************************************************************
//		Component	:BOk
//		Event		:Click
//		Proccess	:OKﾎﾞﾀﾝ ｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010DialogF.BOkClick(Sender: TObject);
begin
	ModalResult:=mrok;
end;

//**********************************************************************
//		Proccess	:初期処理
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure  THAP000010DialogF.Init(arrChildInfo:array of TChildInfo);
var
	i,j		:	integer;

//<DSP>
	iRatio	:	Integer;
	iTop,
	iLeft	:	Integer;
	iChkTop	:	Integer;
begin
	MCheckBox1.Free;
	MCheckBox2.Free;
	MCheckBox3.Free;
	MCheckBox4.Free;
	MCheckBox5.Free;
	MCheckBox6.Free;

	arrChkBox:=nil;
	SetLength(arrChkBox,Length(arrChildInfo));

//<DSP> ↓
{
	for i:=0 to Length(arrChildInfo)-1 do
	begin
		try
			arrChkBox[i]:=TMCheckBox.Create(Self);
		except
			for j:=0 to i-1 do
				arrChkBox[j].Free;
			raise Exception.Create('子AP指定ﾁｪｯｸﾎﾞｯｸｽ作成');
		end;
		with arrChkBox[i] do
		begin
			Parent	:=Self;
			Height	:=19;
			Top		:=_BASE_TOP_+(Height+4)*i;
			Left	:=_BASE_LEFT_;
			Width	:=120;

			with arrChildInfo[i]do
			begin
				Caption:=sCaption;
				Enabled:=bExist;
			end;
//			Checked	:=arrChildBplSelect[i];
//01/05/11 Offをﾃﾞﾌｫﾙﾄ
			Checked	:=False;
			TabOrder:=i;
			OnClick	:=fnCheckBoxClick;
		end;
	end;
	//閉じるﾎﾞﾀﾝ位置
	BOk.Top			:=arrChkBox[Length(arrChkBox)-1].Top+arrChkBox[Length(arrChkBox)-1].Height+10;
	BOk.TabOrder	:=Length(arrChkBox);
	BOk.Enabled		:=False;	//ﾁｪｯｸALLOffなので使用不可ﾃﾞﾌｫﾙﾄ

	BCancel.Top		:=arrChkBox[Length(arrChkBox)-1].Top+arrChkBox[Length(arrChkBox)-1].Height+10;
	BCancel.TabOrder:=Length(arrChkBox)+1;
	//ﾌｫｰﾑ高
	Height:=BOk.Top+BOk.Height+40;
}
	//<MLXDSP>
	iRatio	:=	GetZoomRatio(Pointer(pAppRec));

	iTop	:=	MPanel1.Height + Trunc(5 * iRatio / 100);
	iLeft	:=	Trunc(_BASE_LEFT_ * iRatio / 100);

	iChkTop	:=	Trunc(4 * iRatio / 100);


	for i:=0 to Length(arrChildInfo)-1 do
	begin
		try
			arrChkBox[i]:=TMCheckBox.Create(Self);
		except
			for j:=0 to i-1 do
				arrChkBox[j].Free;
			raise Exception.Create('子AP指定ﾁｪｯｸﾎﾞｯｸｽ作成');
		end;
		with arrChkBox[i] do
		begin
			Parent	:=	Self;
			Height	:=	Trunc(19 * iRatio / 100);
			Top		:=	iTop+ (Height+iChkTop)*i;
			Left	:=	iLeft;
			Width	:=	Trunc(120 * iRatio / 100);

			with arrChildInfo[i]do
			begin
				Caption:=sCaption;
				Enabled:=bExist;
			end;

			Checked	:=False;
			TabOrder:=i;
			OnClick	:=fnCheckBoxClick;
		end;
	end;

	//閉じるﾎﾞﾀﾝ位置
	BOk.Top			:=arrChkBox[Length(arrChkBox)-1].Top+arrChkBox[Length(arrChkBox)-1].Height
					+Trunc( 10 * iRatio / 100);

	BOk.TabOrder	:=Length(arrChkBox);
	BOk.Enabled		:=False;	//ﾁｪｯｸALLOffなので使用不可ﾃﾞﾌｫﾙﾄ

	BCancel.Top		:=arrChkBox[Length(arrChkBox)-1].Top+arrChkBox[Length(arrChkBox)-1].Height
					+Trunc( 10 * iRatio / 100);

	BCancel.TabOrder:=Length(arrChkBox)+1;

	//ﾌｫｰﾑ高
	Height			:=BOk.Top+BOk.Height
					+Trunc (40 * iRatio / 100);
//<DSP> ↑
end;

//**********************************************************************
//		Proccess	:終了処理
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure  THAP000010DialogF.Term(var arrChildInfo:array of TChildInfo);
var
	i:integer;
begin
	for i:=0 to Length(arrChkBox)-1 do
		arrChildInfo[i].bSelected:=arrChkBox[i].Checked;
end;

//**********************************************************************
//		Component	:Form
//		Event		:Destroy
//		Proccess	:ﾌｫｰﾑ破棄
//		Name		:T.Aoki
//		Date		:01/02/09
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010DialogF.FormDestroy(Sender: TObject);
var
	i:integer;
begin
	for i:=0 to Length(arrChkBox)-1 do
		arrChkBox[i].Free;
end;

//**********************************************************************
//		Component	:Form
//		Event		:Show
//		Proccess	:ﾌｫｰﾑ表示
//		Name		:T.Aoki
//		Date		:01/03/14
//		Parameter	:
//		Return		:
//		History		:99/99/(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010DialogF.FormShow(Sender: TObject);
begin
	MjsSetFocus(Self,arrChkBox[0].Name);
end;

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Proccess	:ﾌｫｰﾑ作成時
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:
//		History		:04/12/01(T.Aoki)
//					:MjsFontResize()追加
//**********************************************************************
procedure THAP000010DialogF.FormCreate(Sender: TObject);
begin

	BorderIcons:=[];

	if pAppRec=nil then
		Exit;

	MjsFontResize(THAP000010DialogF(Self), Pointer(pAppRec));  // ﾌｫﾝﾄ･ｻｲｽﾞの変更

end;

//**********************************************************************
//		Component	:BCancel
//		Event		:Click
//		Proccess	:ｷｬﾝｾﾙﾎﾞﾀﾝ ｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:2000/12/21
//		Parameter	:
//		Return		:
//		History		:2000/99/99
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010DialogF.BCancelClick(Sender: TObject);
begin
	ModalResult:=mrCancel;
end;

//**********************************************************************
//		Component	:CheckBox
//		Event		:Click
//		Process		:動的にとったﾁｪｯｸBOXのClick
//		Name		:T.Aoki
//		Date		:01/05/11
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010DialogF.fnCheckBoxClick(Sender:TObject);
var
	i:integer;
begin
	for i:=0 to Length(arrChkBox)-1 do
	begin
		if arrChkBox[i].Checked then
			break;
	end;
	BOk.Enabled:=i<Length(arrChkBox);	//選択あり
end;

//**********************************************************************
//		Process		:KeyMessage判定
//		Name		:T.Aoki
//		Date		:01/07/09
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010DialogF.CMChildKey(var Msg: TWMKey);
var
	ACtl	: TWinControl;
	pKey	: ^Word;
	sShift	: TShiftState;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	sShift	:= MjsKeyDataToShiftState(0);

	ACtl:=Screen.activeControl;
	pKey:=@Msg.CharCode;

	if ACtl is TCheckBox then
	begin
		case pKey^ of
			VK_END,VK_ESCAPE:
			begin
{
				if ACtl=arrChkBox[0] then
					Close
				else
}
//先頭でも追われなくて良い(ﾁｪｯｸ済み->終了がOKなのｷｬﾝｾﾙなのか曖昧)
				begin
					if BOk.Enabled then
						MjsSetFocus(Self,BOk.Name)
					else
						MjsSetFocus(Self,BCancel.Name);
				end;
				pKey^:=0;
				Abort;
			end;
			VK_RETURN,VK_RIGHT,VK_DOWN:
			begin
				MjsNextCtrl(Self);
				pKey^:=0;
				Abort;
			end;
			VK_UP,VK_LEFT:
			begin
				MjsPrevCtrl(Self);
				pKey^:=0;
				Abort;
			end;
		end;
	end;
	if ACtl is TBitBtn then
	begin
		case pKey^ of
			VK_DOWN,VK_RIGHT:
			begin
				MjsNextCtrl(Self);
				pKey^:=0;
				Abort;
			end;
			VK_UP,VK_LEFT:
			begin
				MjsPrevCtrl(Self);
				pKey^:=0;
				Abort;
			end;
		end;
	end;

	inherited;
end;

//**********************************************************************
//		Component	:BAllOn/BAllOff
//		Event		:Click
//		Process		:全選択/全解除ｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:01/06/25
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010DialogF.BAllOnClick(Sender: TObject);
var
	i:integer;
begin
	for i:=0 to Length(arrChkBox)-1 do
		with arrChkBox[i] do
			Checked:=(Sender=BAllOn)and(Enabled);
end;

end.
