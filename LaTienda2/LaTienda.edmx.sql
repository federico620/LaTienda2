
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/04/2022 02:33:59
-- Generated from EDMX file: C:\Users\Trassani\source\repos\LaTienda2\LaTienda2\LaTienda.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LaTienda];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_RubroProducto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoSet] DROP CONSTRAINT [FK_RubroProducto];
GO
IF OBJECT_ID(N'[dbo].[FK_MarcaProducto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoSet] DROP CONSTRAINT [FK_MarcaProducto];
GO
IF OBJECT_ID(N'[dbo].[FK_ColorStock]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StockSet] DROP CONSTRAINT [FK_ColorStock];
GO
IF OBJECT_ID(N'[dbo].[FK_TalleStock]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StockSet] DROP CONSTRAINT [FK_TalleStock];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoStock]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StockSet] DROP CONSTRAINT [FK_ProductoStock];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[RubroSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RubroSet];
GO
IF OBJECT_ID(N'[dbo].[MarcaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MarcaSet];
GO
IF OBJECT_ID(N'[dbo].[ProductoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductoSet];
GO
IF OBJECT_ID(N'[dbo].[StockSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StockSet];
GO
IF OBJECT_ID(N'[dbo].[ColorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ColorSet];
GO
IF OBJECT_ID(N'[dbo].[TalleSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TalleSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'RubroSet'
CREATE TABLE [dbo].[RubroSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] bigint  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MarcaSet'
CREATE TABLE [dbo].[MarcaSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] bigint  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProductoSet'
CREATE TABLE [dbo].[ProductoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] bigint  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Costo] float  NOT NULL,
    [MargenDeGanancia] bigint  NOT NULL,
    [Iva] float  NOT NULL,
    [NetoGravado] float  NOT NULL,
    [PorcentajeIva] bigint  NOT NULL,
    [PrecioDeVenta] float  NOT NULL,
    [Rubro_Id] int  NOT NULL,
    [Marca_Id] int  NOT NULL
);
GO

-- Creating table 'StockSet'
CREATE TABLE [dbo].[StockSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cantidad] nvarchar(max)  NOT NULL,
    [Color_Id] int  NOT NULL,
    [Talle_Id] int  NOT NULL,
    [Producto_Id] int  NOT NULL
);
GO

-- Creating table 'ColorSet'
CREATE TABLE [dbo].[ColorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] bigint  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TalleSet'
CREATE TABLE [dbo].[TalleSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] bigint  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'RubroSet'
ALTER TABLE [dbo].[RubroSet]
ADD CONSTRAINT [PK_RubroSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MarcaSet'
ALTER TABLE [dbo].[MarcaSet]
ADD CONSTRAINT [PK_MarcaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [PK_ProductoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StockSet'
ALTER TABLE [dbo].[StockSet]
ADD CONSTRAINT [PK_StockSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ColorSet'
ALTER TABLE [dbo].[ColorSet]
ADD CONSTRAINT [PK_ColorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TalleSet'
ALTER TABLE [dbo].[TalleSet]
ADD CONSTRAINT [PK_TalleSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Rubro_Id] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [FK_RubroProducto]
    FOREIGN KEY ([Rubro_Id])
    REFERENCES [dbo].[RubroSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RubroProducto'
CREATE INDEX [IX_FK_RubroProducto]
ON [dbo].[ProductoSet]
    ([Rubro_Id]);
GO

-- Creating foreign key on [Marca_Id] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [FK_MarcaProducto]
    FOREIGN KEY ([Marca_Id])
    REFERENCES [dbo].[MarcaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MarcaProducto'
CREATE INDEX [IX_FK_MarcaProducto]
ON [dbo].[ProductoSet]
    ([Marca_Id]);
GO

-- Creating foreign key on [Color_Id] in table 'StockSet'
ALTER TABLE [dbo].[StockSet]
ADD CONSTRAINT [FK_ColorStock]
    FOREIGN KEY ([Color_Id])
    REFERENCES [dbo].[ColorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ColorStock'
CREATE INDEX [IX_FK_ColorStock]
ON [dbo].[StockSet]
    ([Color_Id]);
GO

-- Creating foreign key on [Talle_Id] in table 'StockSet'
ALTER TABLE [dbo].[StockSet]
ADD CONSTRAINT [FK_TalleStock]
    FOREIGN KEY ([Talle_Id])
    REFERENCES [dbo].[TalleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TalleStock'
CREATE INDEX [IX_FK_TalleStock]
ON [dbo].[StockSet]
    ([Talle_Id]);
GO

-- Creating foreign key on [Producto_Id] in table 'StockSet'
ALTER TABLE [dbo].[StockSet]
ADD CONSTRAINT [FK_ProductoStock]
    FOREIGN KEY ([Producto_Id])
    REFERENCES [dbo].[ProductoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoStock'
CREATE INDEX [IX_FK_ProductoStock]
ON [dbo].[StockSet]
    ([Producto_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------