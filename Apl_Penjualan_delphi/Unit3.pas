unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm3 = class(TForm)
    labelnama: TLabel;
    edt1: TEdit;
    btnInsert: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    dbgrd1: TDBGrid;
    lbl1: TLabel;
    edtsearch: TEdit;
    btnSearch: TButton;
    lbl2: TLabel;
    procedure btnInsertClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a : string;

implementation
uses Unit4;
{$R *.dfm}

procedure TForm3.btnInsertClick(Sender: TObject);
begin
Koneksi.Zkategori.SQL.Clear;
Koneksi.Zkategori.SQL.Add('insert into kategori values(null, "'+edt1.Text+'")');
Koneksi.Zkategori.ExecSQL;

Koneksi.Zkategori.SQL.Clear;
Koneksi.Zkategori.SQL.Add('select * from kategori');
Koneksi.Zkategori.Open;
ShowMessage('Data Berhasil Disimpan');
end;

procedure TForm3.btnUpdateClick(Sender: TObject);
begin
with Koneksi.Zkategori do
begin
  SQL.Clear;
  SQL.Add('Update kategori set nama="'+edt1.Text+'" where kategori_id="'+a+'"');
  ExecSQL;

  SQL.Clear;
  SQL.Add('select * from kategori');
  Open;
end;
ShowMessage('Data Berhasil Diubah');
end;


procedure TForm3.dbgrd1CellClick(Column: TColumn);
begin
edt1.Text := Koneksi.Zkategori.Fields[1].AsString;
a:= Koneksi.Zkategori.Fields[0].AsString;
end;

procedure TForm3.btnDeleteClick(Sender: TObject);
begin
with Koneksi.Zkategori do
  begin
    SQL.Clear;
    SQL.Add('Delete from kategori where kategori_id = "'+a+'"');
    ExecSQL;

    SQL.Clear;
    SQL.Add('select * from kategori');
    Open;
  end;
ShowMessage('Data berhasil dihapus');  
end;

end.
