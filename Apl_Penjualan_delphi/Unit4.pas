unit Unit4;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TKoneksi = class(TDataModule)
    con1: TZConnection;
    Zkategori: TZQuery;
    dskategori: TDataSource;
    Zbarang: TZQuery;
    dsbarang: TDataSource;
    Zkustomer: TZQuery;
    dsuser: TDataSource;
    Zsupplier: TZQuery;
    dssupplier: TDataSource;
    Zsatuan: TZQuery;
    dssatuan: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Koneksi: TKoneksi;

implementation

{$R *.dfm}

end.
