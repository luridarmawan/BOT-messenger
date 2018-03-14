unit main;

{$mode objfpc}{$H+}

interface

uses
  telegram_integration,
  Classes, SysUtils, fpcgi, HTTPDefs, fastplaz_handler, database_lib;

type
  TMainModule = class(TMyCustomWebModule)
  private
    TELEGRAM: TTelegramIntegration;
    MessageID: string;
    procedure BeforeRequestHandler(Sender: TObject; ARequest: TRequest);
  public
    constructor CreateNew(AOwner: TComponent; CreateMode: integer); override;
    destructor Destroy; override;

    procedure Get; override;
    procedure Post; override;
  end;

implementation

uses common;

constructor TMainModule.CreateNew(AOwner: TComponent; CreateMode: integer);
begin
  inherited CreateNew(AOwner, CreateMode);
  BeforeRequest := @BeforeRequestHandler;
  TELEGRAM := TTelegramIntegration.Create;
end;

destructor TMainModule.Destroy;
begin
  TELEGRAM.Free;
  inherited Destroy;
end;

// Init First
procedure TMainModule.BeforeRequestHandler(Sender: TObject; ARequest: TRequest);
begin
  //Response.ContentType := 'application/json';
end;

// GET Method Handler
procedure TMainModule.Get;
begin
  //---
  Response.Content := '{}';
end;

// POST Method Handler
procedure TMainModule.Post;
var
  messageText, replyText: string;
begin
  TELEGRAM.RequestContent := Request.Content;
  TELEGRAM.Token := Config['telegram/token'];
  MessageID := TELEGRAM.MessageID;
  messageText := Telegram.Text;

  //-- your code here

  replyText := 'ECHO: ' + messageText;

  die( replyText);

  //-- send response
  TELEGRAM.SendMessage(TELEGRAM.ChatID, replyText);
  Response.Content := 'OK';
  if Config['systems/debug'] then
    Response.Content := TELEGRAM.ResultText;
end;



end.

