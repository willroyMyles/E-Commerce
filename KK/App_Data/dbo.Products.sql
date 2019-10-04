CREATE TABLE [dbo].[Products] (
    [Id]          NVARCHAR (128) NOT NULL,
    [Name]        NVARCHAR (MAX) NULL unique,
    [Price]       INT            NOT NULL,
    [Quantity]    INT            NOT NULL,
    [Purchased]   DATETIME       NOT NULL,
    [Category]    INT            NOT NULL,
    [Img]         NVARCHAR (MAX) NULL,
    [Description] NVARCHAR (MAX) NULL,
    [Owner]       NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED ([Id] ASC)
);

