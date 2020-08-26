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
tableextension 88800 "Red ForNAV Setup" extends "ForNAV Setup"
{
    fields
    {
        field(88800; "Red Append PDF"; Blob)
        {
            Caption = '', Comment = 'DO NOT TRANSLATE';
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(88801; "Red Append PDF File Name"; Text[250])
        {
            Caption = '', Comment = 'DO NOT TRANSLATE';
            DataClassification = OrganizationIdentifiableInformation;
            Editable = false;
            InitValue = 'Click to import...';
        }
    }
}