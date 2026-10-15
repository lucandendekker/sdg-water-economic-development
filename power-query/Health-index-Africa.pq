let
    Source = Excel.Workbook(File.Contents("data/SH_ACS_UNHC.xlsx"), null, false),
    #"Table format_sheet" = Source{[Item="Table format",Kind="Sheet"]}[Data],
    FilterNullAndWhitespace = each List.Select(_, each _ <> null and (not (_ is text) or Text.Trim(_) <> "")),
    #"Removed Other Columns" = Table.SelectColumns(#"Table format_sheet", List.Select(Table.ColumnNames(#"Table format_sheet"), each try not List.IsEmpty(FilterNullAndWhitespace(Table.Column(#"Table format_sheet", _))) otherwise true)),
    #"Changed Type" = Table.TransformColumnTypes(#"Removed Other Columns",{{"Column1", type any}, {"Column2", type text}, {"Column3", type text}, {"Column4", type text}, {"Column5", type text}, {"Column6", type any}, {"Column7", type text}, {"Column8", type text}, {"Column9", type text}, {"Column10", Int64.Type}, {"Column11", Int64.Type}, {"Column12", Int64.Type}, {"Column13", Int64.Type}, {"Column14", Int64.Type}, {"Column15", Int64.Type}, {"Column16", Int64.Type}}),
    #"Promoted Headers" = Table.PromoteHeaders(#"Changed Type", [PromoteAllScalars=true]),
    #"Changed Type1" = Table.TransformColumnTypes(#"Promoted Headers",{{"Goal", Int64.Type}, {"Target", type number}, {"Indicator", type date}, {"SeriesCode", type text}, {"SeriesDescription", type text}, {"GeoAreaCode", Int64.Type}, {"GeoAreaName", type text}, {"Reporting Type", type text}, {"Units", type text}, {"2000", Int64.Type}, {"2005", Int64.Type}, {"2010", Int64.Type}, {"2015", Int64.Type}, {"2017", Int64.Type}, {"2019", Int64.Type}, {"2021", Int64.Type}}),
    #"Merged Queries" = Table.NestedJoin(#"Changed Type1", {"GeoAreaName"}, #"Table Africa Countries", {"Table Africa Countries"}, "Table Africa Countries", JoinKind.Inner),
    #"Removed Columns" = Table.RemoveColumns(#"Merged Queries",{"Table Africa Countries", "SeriesCode", "Indicator", "GeoAreaCode", "Reporting Type", "Units", "Target", "Goal"}),
    #"Unpivoted Columns" = Table.UnpivotOtherColumns(#"Removed Columns", {"SeriesDescription", "GeoAreaName"}, "Attribute", "Value"),
    #"Renamed Columns" = Table.RenameColumns(#"Unpivoted Columns",{{"Attribute", "Year"}, {"Value", "Health index Africa"}})
in
    #"Renamed Columns"
