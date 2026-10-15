let
    Source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("7ZLNbtQwEIBfxdozSBUXzv2jQmwr1N1y2J/DJHGTgWS8dWxW2+fiDXgxxjN2NwUqJM69ZL4Z27E9/tbr2WnfWo+woTNLSBxcGPdAqRD9NyQwH2B0GzqHypkv1jc28WC9czz73FLw0JvTe481kLm1u1j1WPNIBw1/3eC8GxNQm/7y80ewptnEk5N37z9+d+j5dxd2cLWHgPXTeuPuTeisycsuvmLlYsANXbaHXeDwECE4PndvriKS5eNeegxegM8fkNLk0KHbpctd8ekphaGStJMblqUa357hOELc0CdLB67O7ehCx7vPsdIWMaSBa2ighbEGn7iHPUqUb+RTACEUxsiXv+Ye1LVL8JhO8BD51jcwoBzmBvkFckj5Lbe/4bgAZ5ZusIZT89kj1bjjdQtLtoU+waHubN9b3mGB1nswc+soTeFedflNSraIDXAHcli61NZlJBzTlnetbnlHGGzz7BWWQI96oVVu3gqHCqo97/Pqzqs7/+vObPtmPRNvlLI6mkzskcJRoJyqQ5q8oJEOskkKKlNmFkPpT6Wk/i+rdFIWSxJxS+l3vbSqhilnyTTJnkkiqmVKDVPsSl8m/3umnVTEPKEsn7L6VzjPOFqY0yRiwQJFx0nKRmqmUmYuXkqa1VROWh4pV9VRwb9qqiNqauYiq6YTX7UwUXZSEF01f6LkroLqK6wGK74ssYyvjs9SVJ5tt78A", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [GeoAreaName = _t]),
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"GeoAreaName", type text}}),
    #"Renamed Columns" = Table.RenameColumns(#"Changed Type",{{"GeoAreaName", "Table Africa Countries"}})
in
    #"Renamed Columns"
