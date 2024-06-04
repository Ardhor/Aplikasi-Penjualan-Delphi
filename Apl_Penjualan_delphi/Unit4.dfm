object Koneksi: TKoneksi
  OldCreateOrder = False
  Left = 835
  Top = 436
  Height = 150
  Width = 377
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Users\USER\Documents\Pelajaran Sekolah\KULIAH\Semester 4\Pemr' +
      'ograman Visual 2\Tugas\Apl Penjualan delphi\libmysql\libmysql.dl' +
      'l'
    Left = 16
    Top = 8
  end
  object Zkategori: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from kategori')
    Params = <>
    Left = 64
    Top = 8
  end
  object dskategori: TDataSource
    DataSet = Zkategori
    Left = 64
    Top = 56
  end
  object Zbarang: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from barang')
    Params = <>
    Left = 120
    Top = 8
  end
  object dsbarang: TDataSource
    DataSet = Zbarang
    Left = 120
    Top = 56
  end
  object Zkustomer: TZQuery
    Connection = con1
    SQL.Strings = (
      'select * from kustomer')
    Params = <>
    Left = 176
    Top = 8
  end
  object dsuser: TDataSource
    DataSet = Zkustomer
    Left = 176
    Top = 56
  end
  object Zsupplier: TZQuery
    Connection = con1
    SQL.Strings = (
      'select * from supplier')
    Params = <>
    Left = 232
    Top = 8
  end
  object dssupplier: TDataSource
    DataSet = Zsupplier
    Left = 232
    Top = 56
  end
  object Zsatuan: TZQuery
    Connection = con1
    SQL.Strings = (
      'select * from satuan')
    Params = <>
    Left = 288
    Top = 8
  end
  object dssatuan: TDataSource
    DataSet = Zsatuan
    Left = 288
    Top = 56
  end
end
