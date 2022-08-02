//************************************************************************
//	System		:	Galileopt
//	Program		:	社員コード生成ダイアログ
//	ProgramID	:	HAP000010SetCodeDlg
//	Name		:	Yoshitaka Kondo
//	Create		:	2010/04/22
//	History		:	20XX/XX/XX X.Xxxxx
//				:	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//				:	2013/12/12 K.Shinbo			<2013-12-12>
//				:	シーケンス加算桁数制御
//************************************************************************
unit HAP000010SetCodeDlgU;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  VCL.StdCtrls, Buttons, FireDAC.Comp.Client, MJSBitBtn, MJSEdits, MjsKeyDataState,
  MJSCommonU, MjsDBModuleu, MJSLabel, MjsQuery, MJSStrCtrl, MJSDispCtrl,
  HapLibU, HAPMsgU;

type
  TCodeInfo = record
	TIndex	: ShortInt;
	ItemNo	: Integer;
	ItemName: String;
	CutPos	: ShortInt;
	GetPlace: ShortInt;
	Compound: ShortInt;
//↓<2013-12-12>
	AdditionPlace: ShortInt;
	AdditionPoint: String;
//↑<2013-12-12>
  end;

  THAP000010SetCodeDlgF = class(TForm)
	ECode1: TMNumEdit;
	ECode2: TMNumEdit;
	BtnOK: TMBitBtn;
	BtnCancel: TMBitBtn;
	LNewNo: TMLabel;
	TCode1: TMLabel;
	TCode2: TMLabel;
	LCode1: TMLabel;
	LCode2: TMLabel;
	MLabel1: TMLabel;
	MLabel2: TMLabel;
	MLabel3: TMLabel;
	procedure FormCreate(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
	procedure FormShow(Sender: TObject);
	procedure BtnOKClick(Sender: TObject);
	procedure BtnCancelClick(Sender: TObject);
	procedure ECodeExit(Sender: TObject);
	procedure EnterEvent(Sender: TObject);
  private
	{ Private 宣言 }
	m_pRec		: ^TMjsAppRecord;							// APパラメータ構造体
	DBMod		: TMDataModulef;							// DBModule
	recCommon	: ^rcCOMMONAREA;							// 共通ｴﾘｱ
	recSystem	: rcSYSTEMAREA;								// システム・メモリ 構造体

	dbCorp		: TFDConnection;

	ACControl	: TWinControl;

	m_iNo		: Int64;
	m_sTx		: String;

	m_iDigit,
	m_iAttr		: Integer;
//↓<2013-12-12>
	m_iSeqDigit : Integer;				//シーケンス部分の有効桁数
	m_iAddDigit : Integer;				//下位固定文字の桁数
//↑<2013-12-12>
	mqCorp		: TMQuery;

	m_arCodeInfo: array[0..2]of TCodeInfo;

	m_arMakeInfo: array[0..3]of Integer;

	procedure Init;
	function fnGetCode(rCodeInfo:TCodeInfo;iKbn:Integer) : String;
	function fnMakeCode(iKbn1,iKbn2:Integer) : String;

	function fnSetListItem(MEdit:TMNumEdit;iItemNo:Integer;MLabel:TMLabel):Boolean;
	procedure fnSetProperty(iKbn: integer; eEdit: TMNumEdit ;lLabel: TMLabel);

	function fnKbnExit(Sender: TObject): boolean;
	function fnGetListItem(MEdit: TMNumEdit): string;

  public
	{ Public 宣言 }
	constructor	fnCreateDialog(	PForm : TComponent;
								pRec : Pointer	);

	function fnRetNo : Int64;
	function fnRetTx : String;

	function fnRetInfo(iIndex:ShortInt): Integer;

  protected
	procedure CMChildKey(var Msg:TWMKey);message CM_ChildKey;
  end;

//var
//  HAP000010SetCodeDlgF: THAP000010SetCodeDlgF;

implementation

{$R *.DFM}

//************************************************************************
//*	 Proccess		:	CONSTRUCTOR関数
//*	 Paqrameter		:	親Form
//*					:	コード入力Flag
//*					:	コード
//*	 Retrun			:	Nathing
//************************************************************************
constructor	THAP000010SetCodeDlgF.fnCreateDialog(	PForm : TComponent;
													pRec : Pointer	);
begin
	m_pRec		:= pRec;
	DBMod		:= TMDataModulef( m_pRec^.m_pDBModule^ );	// DBModule
	recCommon	:= m_pRec^.m_pCommonArea;					// 共通エリア
	recSystem	:= rcSYSTEMAREA( m_pRec^.m_pSystemArea^ );	// システム・メモリ 構造体 保持

	inherited Create(pForm);
end;

//************************************************************************
//*	 Proccess		:	FormCreate
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000010SetCodeDlgF.FormCreate(Sender: TObject);
begin
// システム色の設定
	MJSCommonU.MJSColorChange ( THAP000010SetCodeDlgF(Self),
								recSystem.SysColorB,
								recSystem.SysColorD,
								recSystem.SysBaseColorB,
								recSystem.SysBaseColorD,
								recCommon.SysFocusColor);

	Init;
end;

//************************************************************************
//*	 Proccess		:	FormDestroy
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000010SetCodeDlgF.FormDestroy(Sender: TObject);
begin
	mqCorp.Close;
	mqCorp.Free;

	DBMod.CopDBClose(dbCorp);			//会社DB Close
end;

//************************************************************************
//*	 Proccess		:	FormShow
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000010SetCodeDlgF.FormShow(Sender: TObject);
begin
	if ECode1.Enabled then
		ECode1.SetFocus
	else
		BtnOK.SetFocus;
end;

//**********************************************************************
//		Process		:CMChildKeyﾒｯｾｰｼﾞ取得
//		Parameter	:
//		Return		:
//**********************************************************************
procedure THAP000010SetCodeDlgF.CMChildKey(var Msg:TWMKey);
var
	sShift	: TShiftState;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	sShift	:= MjsKeyDataToShiftState(Msg.KeyData);

	case Msg.CharCode of									// 他 Key 一般

		VK_TAB :
		begin
			if sShift = [] then
			begin
				Msg.CharCode := 0;
				MjsNextCtrl( Self );
				Abort;
			end
			else if sShift = [ssShift] then
			begin
				Msg.CharCode := 0;
				MjsPrevCtrl( Self );
				Abort;
			end;
		end;

		VK_RETURN :
		begin
			if ACControl is TMBitBtn then
				Exit;

			if sShift = [] then
			begin
				Msg.CharCode := 0;
				MjsNextCtrl( Self );
				abort;
			end;
		end;

		VK_RIGHT :
		begin
			if sShift = [] then
			begin
				Msg.CharCode := 0;
				MjsNextCtrl( Self );
				Abort;
			end;
		end;

		VK_LEFT :
		begin
			if sShift = [] then
			begin
				Msg.CharCode := 0;
				MjsPrevCtrl( Self );
				Abort;
			end;
		end;

		VK_DOWN :
		begin
			if sShift = [] then
			begin
				Msg.CharCode := 0;
				MjsNextCtrl( Self );
				Abort;
			end;
		end;

		VK_UP :
		begin
			if sShift = [] then
			begin
				Msg.CharCode := 0;
				MjsPrevCtrl( Self );
				Abort;
			end;
		end;

		VK_END :
		begin
			if BtnOK.Enabled then
			begin
				MjsSetFocus(Self,BtnOK.Name);
				Msg.CharCode:=0;
				Abort;
			end
			else if btnCancel.Enabled then
			begin
				MjsSetFocus(Self,btnCancel.Name);
				Msg.CharCode:=0;
				Abort;
			end;
		end;

		VK_ESCAPE :
		begin
			if BtnOK.Enabled then
			begin
				MjsSetFocus(Self,BtnOK.Name);
				Msg.CharCode:=0;
				Abort;
			end
			else if btnCancel.Enabled then
			begin
				MjsSetFocus(Self,btnCancel.Name);
				Msg.CharCode:=0;
				Abort;
			end;

		end;
	end;
end;

//************************************************************************
//	 Proccess		:	採番ボタンクリック
//	 Paqrameter		:	Object
//	 Retrun			:	Nathing
//************************************************************************
procedure THAP000010SetCodeDlgF.BtnOKClick(Sender: TObject);
begin

	if (ACControl = ECode1) or (ACControl = ECode2) then
		ECodeExit(ACControl);

	m_sTx	:= LNewNo.Caption;

	if (m_iAttr = 0) or (m_iAttr = 1) then					// 数値
	begin
		if m_sTx = '' then				// 採番不可
			m_iNo	:= 0
		else
			m_iNo	:= StrToInt64(m_sTx);
	end;

	m_arMakeInfo[0]	:= TCode1.Tag;
	m_arMakeInfo[1]	:= ECode1.AsInteger;
	m_arMakeInfo[2]	:= TCode2.Tag;
	m_arMakeInfo[3]	:= ECode2.AsInteger;

	ModalResult	:= mrOK;
end;

//************************************************************************
//	 Proccess		:	キャンセルボタンクリック
//	 Paqrameter		:	Object
//	 Retrun			:	Nathing
//************************************************************************
procedure THAP000010SetCodeDlgF.BtnCancelClick(Sender: TObject);
begin
	ModalResult	:= mrCancel;
end;

//**********************************************************************
//		Event		:fnRetNCode
//		Process		:担当者内部コード戻し
//		Parameter	:
//		Return		:
//**********************************************************************
function THAP000010SetCodeDlgF.fnRetNo : Int64;
begin
	Result := m_iNo;
end;

//**********************************************************************
//		Event		:fnRetGCode
//		Process		:社員外部コード戻し
//		Parameter	:
//		Return		:
//**********************************************************************
function THAP000010SetCodeDlgF.fnRetTx : String;
begin
	Result := m_sTx;
end;

function THAP000010SetCodeDlgF.fnRetInfo(iIndex:ShortInt): Integer;
begin
	Result := m_arMakeInfo[iIndex];
end;

//**********************************************************************
//		Event		: Init
//		Process		: ダイアログ初期処理
//		Parameter	:
//		Return		: none
//**********************************************************************
procedure THAP000010SetCodeDlgF.Init;
begin
	dbCorp	:= DBMod.CopDBOpen(1,m_pRec^.m_iCorpID);

	mqCorp	:= TMQuery.Create(Self);
	DBMod.SetDBInfoToQuery(dbCorp,mqCorp);

	try
		with mqCorp do
		begin
			try
				Close;
				SQL.Clear;
				SQL.Add('SELECT CodeDigit,CodeAttr FROM MasterInfo WHERE MasterKbn = 25');

				Open;
				if Eof then
					Abort;

				m_iDigit	:= GetFld('CodeDigit').AsInteger;
				m_iAttr		:= GetFld('CodeAttr').AsInteger;

				TCode1.Tag	:= 0;
				TCode2.Tag	:= 0;

				ECode1.TagStr	:= '';
				ECode2.TagStr	:= '';

				m_arCodeInfo[0].GetPlace	:= m_iDigit;

				Close;
				SQL.Clear;
				SQL.Add( 'SELECT CC.CompIndex, CC.CutPosition,GetPlace,Compound,'
							+	'CC.AdditionPlace,CC.AdditionPoint,' //<2013-12-12>
							+	'KM.ItemNo, KM.ItemName, KM.Zero'
						+' FROM HAPCC CC'
//<2013-12-12>			+' JOIN HAPKM KM ON KM.ItemNo = CC.ItemNo'
						+' LEFT OUTER JOIN HAPKM KM ON KM.ItemNo = CC.ItemNo' //<2013-12-12>
						+' Order by CompIndex');

				Open(True);

				if EOF then
				begin
					TCode1.Tag	:= 0;
					m_arCodeInfo[0].GetPlace	:= m_iDigit;
				end
				else
				begin

					while not EOF do
					begin
//↓<2013-12-12>
						if GetFld('CompIndex').AsInteger = 0 then
						begin
							// シーケンス
							// AdditionPlace、AdditionPoint のみのセット
							m_arCodeInfo[0].AdditionPlace	:= GetFld('AdditionPlace').AsInteger;
							m_arCodeInfo[0].AdditionPoint	:= GetFld('AdditionPoint').AsString;
							m_iAddDigit						:= Length(m_arCodeInfo[0].AdditionPoint); //下位固定文字の桁数を取得
						end
//↑<2013-12-12>
//<2013-12-12>			if GetFld('CompIndex').AsInteger = 1 then
						else if GetFld('CompIndex').AsInteger = 1 then //<2013-12-12>
						begin
							TCode1.Tag		:= GetFld('ItemNo').AsInteger;
							TCode1.Caption	:= GetFld('ItemName').AsString;

							m_arCodeInfo[1].TIndex	:= 1;
							m_arCodeInfo[1].ItemNo	:= GetFld('ItemNo'	).AsInteger;
							m_arCodeInfo[1].ItemName:= GetFld('ItemName').AsString;
							m_arCodeInfo[1].CutPos	:= GetFld('CutPosition').AsInteger;
							m_arCodeInfo[1].GetPlace:= GetFld('GetPlace').AsInteger;
							m_arCodeInfo[1].Compound:= GetFld('Compound').AsInteger;

							m_arCodeInfo[0].GetPlace	:= m_iDigit - GetFld('GetPlace').AsInteger;

							ECode1.Value	:= 0;

							if GetFld('Zero').AsInteger = 1 then
								ECode1.TagStr	:= '0';
						end
						else if GetFld('CompIndex').AsInteger = 2 then
						begin
							TCode2.Tag		:= GetFld('ItemNo').AsInteger;
							TCode2.Caption	:= GetFld('ItemName').AsString;

							m_arCodeInfo[2].TIndex	:= 2;
							m_arCodeInfo[2].ItemNo	:= GetFld('ItemNo'	).AsInteger;
							m_arCodeInfo[2].ItemName:= GetFld('ItemName').AsString;
							m_arCodeInfo[2].CutPos	:= GetFld('CutPosition').AsInteger;
							m_arCodeInfo[2].GetPlace:= GetFld('GetPlace').AsInteger;
							m_arCodeInfo[2].Compound:= GetFld('Compound').AsInteger;

							m_arCodeInfo[0].GetPlace	:= m_arCodeInfo[0].GetPlace	- GetFld('GetPlace').AsInteger;

							ECode2.Value	:= 0;

							if GetFld('Zero').AsInteger = 1 then
								ECode2.TagStr	:= '0';
						end;

						Next;
					end;

//↓<2013-12-12>
					// シーケンス部分の有効桁数を決定
					// 例
					// シーケンス7桁
					// 1桁目を加算→7-1+1=7、2桁目を加算→7-2+1=6、7桁目を加算→7-7+1=1
					m_iSeqDigit	:= m_arCodeInfo[0].GetPlace - m_arCodeInfo[0].AdditionPlace + 1;
//↑<2013-12-12>
				end;

				LNewNo.Caption	:= fnMakeCode(ECode1.AsInteger,ECode2.AsInteger);

			except
				raise Exception.Create('会社情報 取得失敗');
			end;

			//社員外部コード属性
			if (m_iAttr = 0) or (m_iAttr = 1) then
			begin
				LNewNo.Alignment := taRightJustify;
				LNewNo.Font.Name := 'ＭＳ Ｐ明朝';
			end
			else
			begin
				LNewNo.Alignment := taLeftJustify;
				LNewNo.Font.Name := 'ＭＳ Ｐゴシック';
			end;

			if TCode1.Tag = 0 then
			begin
				TCode1.Caption	:= '';
				ECode1.Value	:= 0;
				LCode1.Caption	:= '';
				TCode1.Enabled	:= FALSE;
				ECode1.Enabled	:= FALSE;
				LCode1.Enabled	:= FALSE;
				ECode1.Visible	:= FALSE;
			end
			else
			begin
				fnSetListItem(ECode1,TCode1.Tag,LCode1);
				ECode1.Value	:=0;
				fnKbnExit(ECode1);
			end;

			if TCode2.Tag = 0 then
			begin
				TCode2.Caption	:= '';
				ECode2.Value	:= 0;
				LCode2.Caption	:= '';
				TCode2.Enabled	:= FALSE;
				ECode2.Enabled	:= FALSE;
				LCode2.Enabled	:= FALSE;
				ECode2.Visible	:= FALSE;
			end
			else
			begin
				fnSetListItem(ECode2,TCode2.Tag,LCode2);
				ECode2.Value	:=0;
				fnKbnExit(ECode2);
			end;
		end;
	finally
		mqCorp.Close;
	end;

end;

//**********************************************************************
//		Event		: fnMakeCode
//		Process		: 社員コード採番
//		Parameter	:
//		Return		:
//**********************************************************************
function THAP000010SetCodeDlgF.fnMakeCode(iKbn1,iKbn2:Integer) : String;
//↓<2013-12-12>
const
	sGCODE : String = ' RIGHT(''0000000000000000'' + GCode, 16) '; //属性が数値でもフリーでも前ゼロ16桁付加して扱う
//↑<2013-12-12>
var
	iGSQS	: Int64;
	sGSTR,
	sGSQS	: String;
	bOver	: Boolean;
begin

	try

		with mqCorp do
		begin
			try
				Close;
				SQL.Clear;
				SQL.Add('SELECT'
				{↓<2013-12-12>
						+' ISNULL(MAX(IF ISNUMERIC(RIGHT(GCode,:hDigit))= 1'
									+' THEN CONVERT(BIGINT, RIGHT(GCode,:hDigit))'
				↑<2013-12-12>}
				{↓<2013-12-12>当初案 フリーがダメ
						+' ISNULL(MAX(IF ISNUMERIC(LEFT(RIGHT(GCode,:hDigit),:hSeqDigit))= 1'
									+' THEN CONVERT(BIGINT, LEFT(RIGHT(GCode,:hDigit),:hSeqDigit))'
				↑<2013-12-12>}
				//↓<2013-12-12>
						// 16桁から下位固定文字桁を除いた桁数で左から取り出したあと、右からシーケンス桁数分を取り出す
						+' ISNULL(MAX(IF ISNUMERIC(RIGHT( LEFT(' + sGCODE + ', 16 - :hAddDigit), :hSeqDigit))= 1'
						   +' THEN CONVERT(BIGINT, RIGHT( LEFT(' + sGCODE + ', 16 - :hAddDigit), :hSeqDigit))'
				//↑<2013-12-12>
									+' ELSE 0 ENDIF)'
									+',0) AS SCODE'
						+' FROM HAPSC');

				if TCode1.Tag > 0 then
				begin
//SA12では不可		SQL.Add('WHERE SUBSTRING(GCode,-(:hDigit)-1,-16+(:hDigit)) = :hGSTR');
					SQL.Add('WHERE LEFT(GCode,LENGTH(GCode)-(:hDigit)) = :hGSTR');
					sGSTR := fnGetCode(m_arCodeInfo[1],iKbn1);
					if TCode2.Tag > 0 then
						sGSTR	:= sGSTR + fnGetCode(m_arCodeInfo[2],iKbn2);

					if (m_iAttr=0) or (m_iAttr=1) then		// 数値コードの場合 16桁0補完
						sGSTR	:= MjsEditNum(StrToInt64(sGSTR),'AAA0',16-m_arCodeInfo[0].GetPlace);

					SetFld('hDigit').AsInteger := m_arCodeInfo[0].GetPlace; //<2013-12-12>バインド変数がこのif内でのみ出現するようになったので、下から移動。
					SetFld('hGSTR').AsString	:= sGSTR;
				end;

//<2013-12-12>	SetFld('hDigit').AsInteger := m_arCodeInfo[0].GetPlace;
//↓<2013-12-12>
				SetFld('hAddDigit').AsInteger := m_iAddDigit;
				SetFld('hSeqDigit').AsInteger := m_iSeqDigit;
//↑<2013-12-12>
				Open(True);

				if EOF then
					Result :=''
				else
				begin
					iGSQS	:= trunc(GetFld('SCODE').AsFloat)+1;

					bOver := FALSE;
//<2013-12-12>		case m_arCodeInfo[0].GetPlace of
					case m_iSeqDigit of //<2013-12-12>シーケンス部分の有効桁で判定
					1:	if iGSQS > 9 then bOver := TRUE;
					2:	if iGSQS > 99 then bOver := TRUE;
					3:	if iGSQS > 999 then bOver := TRUE;
					4:	if iGSQS > 9999 then bOver := TRUE;
					5:	if iGSQS > 99999 then bOver := TRUE;
					6:	if iGSQS > 999999 then bOver := TRUE;
					7:	if iGSQS > 9999999 then bOver := TRUE;
					8:	if iGSQS > 99999999 then bOver := TRUE;
					9:	if iGSQS > 999999999 then bOver := TRUE;
					10:	if iGSQS > 9999999999 then bOver := TRUE;
					end;

					if bOver then
						Result := ''
					else
					begin
						if TCode1.Tag > 0 then				// シーケンス前にコードがある場合0を埋める
						begin
//<2013-12-12>				sGSQS	:= MjsEditNum(iGSQS,'AAA0',m_arCodeInfo[0].GetPlace);
							sGSQS	:= MjsEditNum(iGSQS,'AAA0',m_iSeqDigit); //<2013-12-12>シーケンス前にコードがある場合、シーケンス部分の有効桁分0を埋める

							if (m_iAttr=0) or (m_iAttr=1) then					// 数値コードの場合 16桁0補完を規定値に戻す
								sGSTR	:= IntToStr(StrToInt64(sGSTR));

							Result	:= sGSTR + sGSQS;
						end
						else
							Result	:= IntToStr(iGSQS);

						Result := Result + m_arCodeInfo[0].AdditionPoint;		//<2013-12-12>下位固定文字を付加

						if (m_iAttr = 1) then	// 数値(前0あり)
							Result	:= MjsEditNum(StrToInt64(Result),'AAA0',m_iDigit);
					end;
				end;

			except
				raise Exception.Create('自動採番 取得失敗');
			end;
		end;
	finally
		mqCorp.Close;
	end;

end;

//**********************************************************************
//		Event		: fnGetCode
//		Process		: 設定コード取得
//		Parameter	:
//		Return		:
//**********************************************************************
function THAP000010SetCodeDlgF.fnGetCode(rCodeInfo:TCodeInfo;iKbn:Integer) : String;
var
	qWork	: TMQuery;
begin
	Result := '';

	if rCodeInfo.Compound = 1 then		// 変換表あり
	begin
		qWork	:= TMQuery.Create(Self);
		try
			DBMod.SetDBInfoToQuery(dbCorp,qWork);

			with qWork do
			begin
				try
					Close;
					SQL.Clear;
					SQL.Add( 'SELECT NCode,ConvCode FROM HAPCCC'
							+' WHERE ItemNo = :INO AND NCode = :NNO');

					SetFld('INO').AsInteger	:= rCodeInfo.ItemNo;
					SetFld('NNO').AsInteger	:= iKbn;

					OPEN(TRUE);

					if not EOF then		// 変換表あり
					begin
						if m_iAttr = 2 then					// フリー
							Result := GetFld('ConvCode').AsString
						else
							Result := MjsEditNum(GetFld('ConvCode').AsInteger,'AAA0',rCodeInfo.GetPlace);

						Exit;
					end;
				except
				end;
			end;
		finally
			qWork.Close;
			qWork.Free;
		end;
	end;

	if Length(IntToStr(iKbn)) > rCodeInfo.GetPlace then
	begin
		if rCodeInfo.CutPos = 1 then	//上位
			Result := MjsEditNum(iKbn,'AAA0',rCodeInfo.GetPlace)
		else
			Result := Copy(IntToStr(iKbn),Length(IntToStr(iKbn))-rCodeInfo.GetPlace+1,rCodeInfo.GetPlace);
	end
	else
	begin
		// フリーの場合でも項目2の数値は桁数を揃える(前0埋め)
		if rCodeInfo.TIndex = 2 then
			Result := MjsEditNum(iKbn,'AAA0',rCodeInfo.GetPlace)
		else
			Result := IntToStr(iKbn);
	end;
end;

//***********************************************************************
//		Proccess	:ﾘｽﾄから該当名称をセット
//		Name		:Qiurong
//		Date		:2001/01/17
//		Paremeter	:
//		Return		:0:リストなし １；リスト有り
//		History		:2001/02/01 KOS HORI
//		History		:2001/08/20 KOS HORI
//					: functionに変更。ListCountを返す
//***********************************************************************
function THAP000010SetCodeDlgF.fnSetListItem(MEdit: TMNumEdit; iItemNo: Integer;
  MLabel: TMLabel): Boolean;
var
	sItems	: string;
	rcMsg	: TMjsMsgRec;
begin
	Result	:= False;

	MEdit.SelectItems.Clear;

	try
		try
		with mqCorp do
		begin
			Close();
			SQL.Clear();

			if iItemNo = 151100 then	//支給G
			begin
				SQL.Add( 'SELECT '
						+ 'PayGroupNo KubunNo, '
						+ 'PayGroupName KubunName'	);
				SQL.Add( 'From HAPPG'				);
				SQL.Add( 'Order By KubunNo'			);
			end
			else if iItemNo = 151400 then	//計算G
			begin
				SQL.Add( 'SELECT '
						+ 'CalcGroupNo KubunNo, '
						+ 'CalcGroupName KubunName'	);
				SQL.Add( 'From HAPCG'				);
				SQL.Add( 'Order By KubunNo'			);
			end
			else
			begin
				SQL.Add( 'SELECT '
						+ 'MN.KubunNo, '
						+ 'MN.KubunName'	);
				SQL.Add( 'From HAPMN MN,HAPKM KM'		);
				SQL.Add( 'Where KM.ItemNo=:pItemNo'
						+ ' And KM.KubunNo = MN.ItemNo'	);
				SQL.Add( 'Order By MN.KubunNo'			);

				ParamByName('pItemNo').AsInteger:=iItemNo;
			end;

			if not Open then
				Abort;

			if Eof and (iItemNo <> 110100) then
			begin
				fnSetProperty(2,MEdit,MLabel);
				exit;
			end;

			if (iItemNo = 110100) then
			begin
				sItems	:= '0:会社規程';
				MEdit.SelectItems.Append(sItems);
			end;

			while not eof do
			begin
				sItems	:= GetFld('KubunNo').AsString + ':' + GetFld('KubunName').AsString;
				MEdit.SelectItems.Append(sItems);
				Next;
			end;

			fnSetProperty(0,MEdit,MLabel);

			MEdit.MaxValue := GetFld('KubunNo').AsInteger ;
			Result	:= True;
		end;
	except
		GetMsg(rcMsg,1,5);
		with rcMsg do
		begin
			MjsMessageBoxEx(Self,'区分名称の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			abort;
		end;
	end;
	finally
		mqCorp.Close;
	end;
end;

//**********************************************************************
//		Proccess	:画面表示時、入力可不可設定
//		Name		:崔
//		Date		:2001/03/28
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000010SetCodeDlgF.fnSetProperty(iKbn: integer; eEdit: TMNumEdit;
  lLabel: TMLabel);
begin
	Case iKbn of
		0:	//使用可
		begin
			eEdit.Color:=clWindow;
			eEdit.ParentColor:=False;
			eEdit.Enabled:=True;
			if eEdit.TagStr ='0' then
			begin
				eEdit.Zero	:=True;
			end;
		end;
		1:	//使用不可＆データあり
		begin
			eEdit.ParentColor:=True;
			eEdit.Enabled:=True;		//←Panelを使用不可とする
			if eEdit.TagStr ='0' then
			begin
				eEdit.Zero	:=True;
			end;
		end;
		2:	//使用不可＆データなし
		begin
			eEdit.ParentColor:=True;
			eEdit.Enabled	:=False;
			eEdit.Value		:=0;
			eEdit.Zero		:=False;
			if lLabel<>nil then
				lLabel.Caption :='';
		end;
	end;
end;

//**********************************************************************
//		Event		: EnterEvent
//		Process		: パーツコントロール取得
//		Parameter	:
//		Return		:
//**********************************************************************
procedure THAP000010SetCodeDlgF.EnterEvent(Sender: TObject);
begin
	ACControl	:= Screen.ActiveControl;

end;

//**********************************************************************
//		Event		: ECodeExit
//		Process		: コード名称取得
//		Parameter	:
//		Return		:
//**********************************************************************
procedure THAP000010SetCodeDlgF.ECodeExit(Sender: TObject);
begin
	if not fnKBNExit(Sender) then
	begin
		Beep;
		MjsSetFocus(Self, TMNumEdit(Sender).Name);
		Abort;
	end;

	LNewNo.Caption	:= fnMakeCode(ECode1.AsInteger,ECode2.AsInteger);
end;

//***********************************************************************
//		Component	:ﾄﾞﾛｯﾌﾟﾀﾞｳﾝﾘｽﾄから選択する箇所
//		Event		:Exit
//		Proccess	:区分ｺﾝﾎﾟｰﾈﾝﾄ ﾌｫｰｶｽ消失
//		Name		:T.Aoki
//		Date		:2000/12/20
//		Parameter	:
//		Return		:
//		Hoistory	:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//***********************************************************************
function THAP000010SetCodeDlgF.fnKbnExit(Sender: TObject): boolean;
var
	LName:TMLabel;
begin
	Result := True;

	LName := TMLabel(MjsFindCtrl(Self,'L'+Copy(TMNumEdit(Sender).Name,2,Length(TMNumEdit(Sender).Name))));

	if (LName<>nil) and ((Sender as TMNumEdit).SelectItems.Count>0) then
	begin
		LName.Caption	:='';
		LName.Caption	:= fnGetListItem(Sender as TMNumEdit);
		if (LName.Caption='') and (trim((Sender as TMNumEdit).Text)<>'') then
		begin
			Result:=False;
		end;
	end;
end;

//***********************************************************************
//		Proccess	:ﾘｽﾄから該当名称を取得
//		Name		:T.Aoki
//		Date		:2000/12/11
//		Paremeter	:
//		Return		:
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//***********************************************************************
function THAP000010SetCodeDlgF.fnGetListItem(MEdit: TMNumEdit): string;
var
	i:integer;
begin
	Result:='';

	if MEdit.SelectItems.Count = 0 then
		Exit;

	for i:=0 to MEdit.Selectitems.Count-1 do
	begin
		if MEdit.Value=StrToInt(Copy(MEdit.SelectItems[i],1,Pos(':',MEdit.SelectItems[i])-1)) then
			break;
	end;

	if i=MEdit.Selectitems.Count then
		Exit;

	Result:=Copy(	MEdit.SelectItems[i],
					Pos(':',MEdit.SelectItems[i])+1,
					Length(MEdit.SelectItems[i])-Pos(':',MEdit.SelectItems[i]));
end;

end.
