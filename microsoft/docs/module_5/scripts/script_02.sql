COPY INTO dbo.StageCustomer
(
    GeographyKey, 
    CustomerAlternateKey, 
    Title, 
    FirstName, 
    MiddleName, 
    LastName, 
    NameStyle, 
    BirthDate, 
    MaritalStatus, 
    Suffix, 
    Gender, 
    EmailAddress, 
    YearlyIncome, 
    TotalChildren, 
    NumberChildrenAtHome, 
    EnglishEducation, 
    SpanishEducation, 
    FrenchEducation, 
    EnglishOccupation, 
    SpanishOccupation, 
    FrenchOccupation,
    HouseOwnerFlag, 
    NumberCarsOwned, 
    AddressLine1, 
    AddressLine2, 
    Phone, 
    DateFirstPurchase, 
    CommuteDistance
)
FROM 'https://datalakejz25tul.dfs.core.windows.net/files/data/Customer.csv'
WITH
(
    FILE_TYPE = 'CSV',
    MAXERRORS = 5,
    FIRSTROW = 2,
    ERRORFILE = 'https://datalakejz25tul.dfs.core.windows.net/files/'
);