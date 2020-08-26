// Copyright (c) 2017-2020 Red and Bundle - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to Red and Bundle.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from Red and Bundle.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
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