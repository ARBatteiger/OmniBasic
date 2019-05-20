VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   375
      Left            =   600
      TabIndex        =   0
      Top             =   2400
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ByteCounter(16) As Long
Dim tmpComm(16) As String
Dim Sync(16) As Byte
Dim Preamble(16) As Byte
Dim DataField(16) As Long
Dim Mode(16) As Byte
Dim TempDataStr(16) As String
Dim MsgType(16) As Byte
Dim TempMode As Long
Dim TempMsgType As Long
Dim ShotDataTemp As Long
Dim LastInoTime As Long
Dim HostAvailable As Boolean

Private Sub Command1_Click()
UpdateCurrentShot.CurrentShotMode(0) = &H0
UpdateCurrentShot.CurrentShotMode(1) = &H11
UpdateCurrentShot.CurrentShotMode(2) = &H22
UpdateCurrentShot.CurrentShotMode(3) = &H33
UpdateCurrentShot.CurrentShotMode(4) = &H44
UpdateCurrentShot.CurrentShotMode(5) = &H55
UpdateCurrentShot.CurrentShotMode(6) = &H66
UpdateCurrentShot.CurrentShotMode(7) = &H77
UpdateCurrentShot.CurrentShotMode(8) = &H88
UpdateCurrentShot.CurrentShotMode(9) = &H99
UpdateCurrentShot.CurrentShotMode(10) = &HAA
UpdateCurrentShot.CurrentShotMode(11) = &HBB
UpdateCurrentShot.CurrentShotMode(12) = &HCC
UpdateCurrentShot.CurrentShotMode(13) = &HDD
UpdateCurrentShot.CurrentShotMode(14) = &HEE
UpdateCurrentShot.CurrentShotMode(15) = &HFF

UpdateCurrentShot.CurrentShotTime(0) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(1) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(2) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(3) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(4) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(5) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(6) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(7) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(8) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(9) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(10) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(11) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(12) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(13) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(14) = &HFFFFFFFF
UpdateCurrentShot.CurrentShotTime(15) = &HFFFFFFFF

UpdateCurrentShot.CurrentShotData(0, 0) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 1) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 2) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 3) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 4) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 5) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 6) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 7) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 8) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 9) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 10) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 11) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 12) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 13) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 14) = &HCCCCCCCC
UpdateCurrentShot.CurrentShotData(0, 15) = &HCCCCCCCC

UpdateCurrentShot.CurrentShotData(15, 0) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 1) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 2) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 3) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 4) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 5) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 6) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 7) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 8) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 9) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 10) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 11) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 12) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 13) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 14) = &HDEEDDEED
UpdateCurrentShot.CurrentShotData(15, 15) = &HDEEDDEED

UpdateCurrentShot.CurrentShotData(1, 0) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 1) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 2) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 3) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 4) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 5) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 6) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 7) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 8) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 9) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 10) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 11) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 12) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 13) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 14) = &HDDDDDDDD
UpdateCurrentShot.CurrentShotData(1, 15) = &HDDDDDDDD

UpdateCurrentShot.CurrentShotAlarm(0) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(1) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(2) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(3) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(4) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(5) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(6) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(7) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(8) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(9) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(10) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(11) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(12) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(13) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(14) = &HAAAA
UpdateCurrentShot.CurrentShotAlarm(15) = &HAAAA

UpdateCurrentShot.CurrentShotTotal(0) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(1) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(2) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(3) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(4) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(5) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(6) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(7) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(8) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(9) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(10) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(11) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(12) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(13) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(14) = &HBBBBBBBB
UpdateCurrentShot.CurrentShotTotal(15) = &HBBBBBBBB

UpdateCurrentShot.CurrentShotFirstNdx(0) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(1) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(2) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(3) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(4) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(5) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(6) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(7) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(8) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(9) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(10) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(11) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(12) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(13) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(14) = &HEEEEEEEE
UpdateCurrentShot.CurrentShotFirstNdx(15) = &HEEEEEEEE

UpdateCurrentShot.CurrentShotLastNdx(0) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(1) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(2) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(3) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(4) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(5) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(6) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(7) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(8) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(9) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(10) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(11) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(12) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(13) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(14) = &H11111111
UpdateCurrentShot.CurrentShotLastNdx(15) = &H11111111

UpdateCurrentShot.CurrentShotFirstModeNdx(0) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(1) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(2) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(3) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(4) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(5) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(6) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(7) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(8) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(9) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(10) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(11) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(12) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(13) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(14) = &H22222222
UpdateCurrentShot.CurrentShotFirstModeNdx(15) = &H22222222

UpdateCurrentShot.CurrentShotLastModeNdx(0) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(1) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(2) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(3) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(4) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(5) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(6) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(7) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(8) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(9) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(10) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(11) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(12) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(13) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(14) = &H33333333
UpdateCurrentShot.CurrentShotLastModeNdx(15) = &H33333333

UpdateCurrentShot.CurrentShotFirstAlarmNdx(0) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(1) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(2) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(3) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(4) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(5) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(6) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(7) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(8) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(9) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(10) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(11) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(12) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(13) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(14) = &H44444444
UpdateCurrentShot.CurrentShotFirstAlarmNdx(15) = &H44444444

UpdateCurrentShot.CurrentShotLastAlarmNdx(0) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(1) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(2) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(3) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(4) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(5) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(6) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(7) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(8) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(9) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(10) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(11) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(12) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(13) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(14) = &H55555555
UpdateCurrentShot.CurrentShotLastAlarmNdx(15) = &H55555555

UpdateCurrentShot.CurrentShotFirstSetupNdx(0) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(1) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(2) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(3) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(4) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(5) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(6) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(7) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(8) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(9) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(10) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(11) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(12) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(13) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(14) = &H66666666
UpdateCurrentShot.CurrentShotFirstSetupNdx(15) = &H66666666

UpdateCurrentShot.CurrentShotLastSetupNdx(0) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(1) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(2) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(3) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(4) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(5) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(6) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(7) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(8) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(9) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(10) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(11) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(12) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(13) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(14) = &H77777777
UpdateCurrentShot.CurrentShotLastSetupNdx(15) = &H77777777

UpdateCurrentShot.CurrentShotAutoRejected(0) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(1) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(2) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(3) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(4) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(5) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(6) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(7) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(8) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(9) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(10) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(11) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(12) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(13) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(14) = &H88888888
UpdateCurrentShot.CurrentShotAutoRejected(15) = &H88888888

UpdateCurrentShot.CurrentShotAccepted(0) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(1) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(2) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(3) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(4) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(5) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(6) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(7) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(8) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(9) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(10) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(11) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(12) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(13) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(14) = &H99999999
UpdateCurrentShot.CurrentShotAccepted(15) = &H99999999

Open Trim$(FilePath) & "TestShot" For Binary As #UpdateCurrentShotFile
'Get #UpdateCurrentShotFile, 1, UpdateCurrentShot
UpdateCurrentShot.CurrentShotAlarm(CommNum) = 0
Put #UpdateCurrentShotFile, 1, UpdateCurrentShot
Close #UpdateCurrentShotFile
End
End Sub

Private Sub Form_Load()
'FilePath = "C:\Innomation\Monitor\"
End Sub
