unit main;

{$mode objfpc}{$H+}

interface

uses
  facebookmessenger_integration,
  Classes, SysUtils, fpcgi, HTTPDefs, fastplaz_handler, database_lib;

type
  TMainModule = class(TMyCustomWebModule)
  private
    FACEBOOK: TFacebookMessengerIntegration;
    procedure BeforeRequestHandler(Sender: TObject; ARequest: TRequest);
  public
    constructor CreateNew(AOwner: TComponent; CreateMode: integer); override;
    destructor Destroy; override;

    procedure Get; override;
    procedure Post; override;
  end;

implementation

uses json_lib, common;

constructor TMainModule.CreateNew(AOwner: TComponent; CreateMode: integer);
begin
  inherited CreateNew(AOwner, CreateMode);
  BeforeRequest := @BeforeRequestHandler;
  FACEBOOK:= TFacebookMessengerIntegration.Create;
end;

destructor TMainModule.Destroy;
begin
  FACEBOOK.Free;
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
  FACEBOOK.RequestContent := Request.Content;
  FACEBOOK.Token := Config['facebook/token'];
  messageText := FACEBOOK.Text;

  //-- your code here

  replyText := 'ECHO: ' + messageText;




  //-- send response
  FACEBOOK.Send(FACEBOOK.UserID, replyText);
  Response.Content := 'OK';
  if Config['systems/debug'] then
    Response.Content := FACEBOOK.ResultText;
end;



end.

