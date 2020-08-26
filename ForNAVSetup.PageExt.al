// Appends PDF Files to your ForNAV reports
// Copyright (C) 2020  Red and Bundle
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
pageextension 88800 "Red ForNAV Setup" extends "ForNAV Setup"
{
    layout
    {
        addlast(Logo)
        {
            field(RedAppendPDF; "Red Append PDF File Name")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Append PDF File';
                ToolTip = 'Specifies the pdf file you want to append to reports.';

                trigger OnDrillDown()
                var
                    TempBlob: Codeunit "Temp Blob";
                    FileManagement: Codeunit "File Management";
                begin
                    CalcFields("List Report Watermark (Lands.)");
                    if not ("Red Append PDF File Name" in ['Click to import...', '']) then begin
                        TempBlob.FromRecord(Rec, FieldNo("Red Append PDF"));
                        Hyperlink(FileManagement.BLOBExport(TempBlob, "Red Append PDF File Name", false));
                    end else
                        ImportPDFFromClientFile(FieldNo("Red Append PDF"));
                    Modify();
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
                ApplicationArea = Basic, Suite;
                Caption = 'Append PDF';
                ToolTip = 'Deletes the pdf file you want to append to reports.';
                Image = Delete;

                trigger OnAction()
                var
                    AreYouSureQst: label 'Are you sure you want to clear %1?', Comment = '%1 is the field to delete';
                begin
                    if not Confirm(AreYouSureQst, false, FieldCaption("Document Watermark")) then
                        exit;

                    "Red Append PDF File Name" := 'Click to import...';
                    Clear("Red Append PDF");
                    Modify();
                end;
            }
        }
    }
}