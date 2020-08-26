// Copyright (c) 2017-2020 Red and Bundle - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to Red and Bundle.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from Red and Bundle.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
pageextension 88800 "Red ForNAV Setup" extends "ForNAV Setup"
{
    layout
    {
        addlast(Logo)
        {
            field(RedAppendPDF; "Red Append PDF File Name")
            {
                ApplicationArea = Basic;
                Caption = 'Append PDF File';

                trigger OnDrillDown()
                var
                    TempBlob: Codeunit "Temp Blob";
                    FileManagement: Codeunit "File Management";
                begin
                    CalcFields("List Report Watermark (Lands.)");
                    if "Red Append PDF File Name" <> 'Click to import...' then begin
                        TempBlob.FromRecord(Rec, FieldNo("Red Append PDF"));
                        Hyperlink(FileManagement.BLOBExport(TempBlob, "Red Append PDF File Name", false));
                    end else
                        ImportWatermarkFromClientFile(FieldNo("Red Append PDF"));
                    Modify;
                end;
            }
        }
    }

    actions
    {
        addlast(Delete)
        {
            action(RedDeleteAppendPDF)
            {
                ApplicationArea = Basic;
                Caption = 'Append PDF';
                Image = Delete;

                trigger OnAction()
                var
                    AreYouSureQst: label 'Are you sure you want to clear %1?';
                begin
                    if not Confirm(AreYouSureQst, false, FieldCaption("Document Watermark")) then
                        exit;

                    "Red Append PDF File Name" := 'Click to import...';
                    Clear("Red Append PDF");
                    Modify;
                end;
            }
        }
    }
}