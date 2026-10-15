let
    Source = Table.NestedJoin(Data, {"Data Source"}, #"Table Africa Countries", {"Table Africa Countries"}, "Table Africa Countries", JoinKind.Inner),
    #"Renamed Columns" = Table.RenameColumns(Source,{{"Data Source", "Country"}}),
    #"Removed Columns" = Table.RemoveColumns(#"Renamed Columns",{"World Development Indicators", "Column4", "Column5", "Column6", "Column7", "Column8", "Column9", "Column10", "Column11", "Column12", "Column13", "Column14", "Column15", "Column16", "Column17", "Column18", "Column19", "Column20", "Column21", "Column22", "Column23", "Column24", "Column25", "Column26", "Column27", "Column28", "Column29", "Column30", "Column31", "Column32", "Column33", "Column34", "Column35", "Column36", "Column37", "Column38", "Column39", "Column40", "Column41", "Column42", "Column43", "Column44"}),
    #"Renamed Columns1" = Table.RenameColumns(#"Removed Columns",{{"Column45", "2000"}, {"Column46", "2001"}, {"Column47", "2002"}, {"Column48", "2003"}, {"Column49", "2004"}, {"Column50", "2005"}, {"Column51", "2006"}, {"Column52", "2007"}, {"Column53", "2008"}, {"Column54", "2009"}, {"Column55", "2010"}, {"Column56", "2011"}, {"Column57", "2012"}, {"Column58", "2013"}, {"Column59", "2014"}, {"Column60", "2015"}, {"Column61", "2016"}, {"Column62", "2017"}, {"Column63", "2018"}, {"Column64", "2019"}, {"Column65", "2020"}, {"Column66", "2021"}, {"Column67", "2022"}, {"Column68", "2023"}, {"Column69", "2024"}}),
    #"Removed Columns1" = Table.RemoveColumns(#"Renamed Columns1",{"Table Africa Countries", "Column3"}),
    #"Unpivoted Other Columns" = Table.UnpivotOtherColumns(#"Removed Columns1", {"Country"}, "Attribute", "Value"),
    #"Renamed Columns2" = Table.RenameColumns(#"Unpivoted Other Columns",{{"Attribute", "Year"}}),
    #"Changed Type" = Table.TransformColumnTypes(#"Renamed Columns2",{{"Value", type number}}),
    #"Renamed Columns3" = Table.RenameColumns(#"Changed Type",{{"Value", "GDP per capita (US$)"}})
in
    #"Renamed Columns3"
