USE [EdicionesElemento]
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[ID_Autor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NULL,
 CONSTRAINT [PK_Autores] PRIMARY KEY CLUSTERED 
(
	[ID_Autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editoriales]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editoriales](
	[ID_Editorial] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Editorial] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Editoriales] PRIMARY KEY CLUSTERED 
(
	[ID_Editorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formatos]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formatos](
	[ID_Formato] [int] IDENTITY(1,1) NOT NULL,
	[Medidas_Formato] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Formatos] PRIMARY KEY CLUSTERED 
(
	[ID_Formato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[ISBN] [varchar](50) NOT NULL,
	[Titulo] [varchar](200) NOT NULL,
	[ID_Formato] [int] NULL,
	[Sinopsis] [text] NULL,
	[Fecha_Edicion] [int] NOT NULL,
	[Precio] [float] NULL,
	[Portada] [varchar](max) NULL,
	[Estado] [bit] NULL,
	[ID_Editorial] [int] NULL,
 CONSTRAINT [PK_libros] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibrosxAutores]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibrosxAutores](
	[ISBN] [varchar](50) NOT NULL,
	[ID_Autor] [int] NOT NULL,
 CONSTRAINT [PK_LibrosxAutores] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC,
	[ID_Autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibrosxEditoriales]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibrosxEditoriales](
	[ISBN] [varchar](50) NOT NULL,
	[ID_Editorial] [int] NOT NULL,
 CONSTRAINT [PK_LibrosxEditoriales] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC,
	[ID_Editorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Usuario] [varchar](20) NOT NULL,
	[contrasenia] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[celular] [varchar](10) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[TipoUsuario] [bit] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autores] ON 

INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (1, N'Ana María', N'Torres')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (2, N'Francisco', N'Camargo')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (3, N'Alicia Esther', N'Pereyra')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (4, N'Ana Eulogia', N'Bisignani')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (5, N'Carlos', N'Chifa')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (6, N'Armando', N'Ricciardi')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (7, N'Ricardo Luis', N'Flaiban')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (8, N'José Luis', N'Veiga')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (9, N'Gabriela', N'Nicolari')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (10, N'Irma Graciela', N'Georgetti')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (11, N'Carlos Alberto', N'Drag')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (12, N'Rosana Leonor', N'García Torelles')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (13, N'María Elena', N'Haramboure')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (14, N'Graciela Margarita', N'González')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (15, N'Ana Eulogia ', N'Bisignani')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (16, N'Rosana Leonor', N'Garcia Torrelles')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (17, N'Carina', N'Ávalos')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (18, N'Laura', N'Ramella')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (19, N'Evelina Rosanna', N'Zeballos')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (20, N'Gabriela', N'Renteria')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (21, N'Walter Pablo', N'Franco')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (22, N'Mónica', N'Malenchini')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (23, N'Barbú', N'')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (24, N'Iris', N'Cipolat')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (25, N'Marcela', N'Lichtensztejn')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (26, N'Osvaldo', N'Contreras Iriarte')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (27, N'Ezequiel', N'Bajadish')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (28, N'Miguel Ángel', N'Aulmann')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (29, N'Carlos', N'Chifa')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (30, N'Armando', N'Ricciardi')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (31, N'Adrián', N'Ortiz')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (32, N'Norberto Julio', N'Naccarati')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (33, N'Roberto Salvador', N'Pancaldi')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (34, N'Pablo', N'Buol')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (35, N'Chandika', N'')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (36, N'Danusa María', N'Barbosa Moreira')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (37, N'Flavio', N'Katzev')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (38, N'Héctor', N'Oliboni')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (39, N'Marcelo', N'Petrelli')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (40, N'Peggy Beltza', N'Serrana')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (41, N'Jorge', N'Suárez')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (42, N'Tamenega', N'Shunsuy')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (43, N'Ángela', N'Ondo Misi')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (44, N'Américo', N'Flaiban')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (45, N'Leonardo', N'Killian')
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido]) VALUES (46, N'Jorge Hugo', N'De Vito')
SET IDENTITY_INSERT [dbo].[Autores] OFF
GO
SET IDENTITY_INSERT [dbo].[Editoriales] ON 

INSERT [dbo].[Editoriales] ([ID_Editorial], [Nombre_Editorial]) VALUES (1, N'Elemento')
INSERT [dbo].[Editoriales] ([ID_Editorial], [Nombre_Editorial]) VALUES (2, N'CADAN')
INSERT [dbo].[Editoriales] ([ID_Editorial], [Nombre_Editorial]) VALUES (3, N'Sedimentos')
INSERT [dbo].[Editoriales] ([ID_Editorial], [Nombre_Editorial]) VALUES (4, N'Divina Salud')
SET IDENTITY_INSERT [dbo].[Editoriales] OFF
GO
SET IDENTITY_INSERT [dbo].[Formatos] ON 

INSERT [dbo].[Formatos] ([ID_Formato], [Medidas_Formato]) VALUES (1, N'15cm x 23cm')
INSERT [dbo].[Formatos] ([ID_Formato], [Medidas_Formato]) VALUES (2, N'15cm x 22cm')
INSERT [dbo].[Formatos] ([ID_Formato], [Medidas_Formato]) VALUES (3, N'Ebook')
INSERT [dbo].[Formatos] ([ID_Formato], [Medidas_Formato]) VALUES (4, N'14cm x 20cm')
INSERT [dbo].[Formatos] ([ID_Formato], [Medidas_Formato]) VALUES (5, N'28cm x 20cm')
INSERT [dbo].[Formatos] ([ID_Formato], [Medidas_Formato]) VALUES (6, N'22cm x 15cm')
INSERT [dbo].[Formatos] ([ID_Formato], [Medidas_Formato]) VALUES (7, N'23cm x 16cm')
INSERT [dbo].[Formatos] ([ID_Formato], [Medidas_Formato]) VALUES (8, N'23cm x 15cm')
INSERT [dbo].[Formatos] ([ID_Formato], [Medidas_Formato]) VALUES (9, N'20cm x 14cm')
INSERT [dbo].[Formatos] ([ID_Formato], [Medidas_Formato]) VALUES (10, N'23cm x 17cm')
INSERT [dbo].[Formatos] ([ID_Formato], [Medidas_Formato]) VALUES (11, N'20cm x 20cm')
SET IDENTITY_INSERT [dbo].[Formatos] OFF
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'1122334455668', N'De mujeres y poetas y Serpientes del Norte de la China', 1, N'Si te digo de que trata este libro, no  me lo vas a creer, ya la tapa es increíble, una serpiente de madera? que viene del horóscopo chino? si te interesa la china y las serpientes, no tengo idea si es el libro adecuado para vos, porque yo solo vi la portada.
Besitos besitos chau chau.', 2000, 0, N'~/img/portadas/1122334455668.jpg', 1, 2)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'1122334455677', N'Teatro II', 5, N'Recordar y repetir parecen ser dos de los mecanismos míticos del teatro; esa especie de celebración ritual de la memoria. Un acto de herencia perpetua que toma su energía desde esa misma memoria viva o desde los diferentes soportes que así la mantienen. En el teatro todo lo dado antes fue recibido. De allí el valor de los testamentos, esos documentos que los reasignan y reparten. Dionisio, el programa radial de Héctor Oliboni -y su revista- son un perfecto ejemplo de lo que –durante dos décadas nada menos- pueden hacer esos soportes. Un medio –en su sentido literal, el de mediar entre dos- que viene portando (y aportando) la experiencia escénica de una generación de artistas a la otra. De cabeza en cabeza. Y como siempre en el teatro en su maravillosa conversión de norma: de esa cabeza iluminada a un cuerpo emocionado. Dionisio ha sido en estos 20 años un perfecto arte-facto teatral.', 2020, 0, N'~/img/portadas/1122334455677.jpg', 0, 2)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'1122334455971', N'Daiki : entrenamiento', 4, N'Soy un sinopsis', 2020, 0, N'~/img/portadas/1122334455971.jpg', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'8899457894654', N'Feria Americana', 3, N'Qué me motivó a escribir este libro de cuentos cortos? Quiero, de alguna forma, dejar plasmado el reconocimiento a este grupo de personas que, por la inspiración del Padre Ale, se juntó primero para orar y luego sin proponérselo, se transformó en una fuente potencial de ayuda. 
Lo escrito, con todos sus errores y falencias, no tiene ninguna pretensión de un hecho literario: solamente narra las vivencias de esta feria americana, ya desde la óptica de una crónica, ya desde la más pura ficción.   
Inspirada en el diario tratar con la gente, que son los verdaderos protagonistas. 
No muy convencionalmente, cada cuento comienza nombrando, por su nombre de pila o su sobrenombre, a quienes han hecho posible que todos juntos vayamos aportando un granito de arena a esta montaña de carencias en la que está sumida gran parte de la sociedad. Pero, como tampoco puedo desprenderme de afectos, situaciones y personas, que forman parte de mi vida, por último dejo constancia de las primeras cosas que pudimos lograr con amor y el gran esfuerzo de esta fructuosa y larga tarea. 
Gente amiga, gente querida, les agradezco ser parte de este hermoso sueño.
', 2020, 0, N'~/img/portadas/8899457894654.jpg', 1, 2)
GO
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'111-111-1111-10-0', 1)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'111-111-1111-10-2', 1)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'111-111-1111-12-5', 1)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'1122334455668', 46)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'1122334455677', 38)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'1122334455971', 1)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'555-555-5555-55-5', 14)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'88888888888', 6)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'88888888888', 10)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'8899457894654', 1)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'978-987-05-9354-1', 1)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'978-987-05-9354-2', 4)
GO
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'111-111-1111-10-0', 4)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'111-111-1111-10-2', 4)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'111-111-1111-12-5', 3)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'1122334455668', 2)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'1122334455677', 2)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'1122334455971', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'555-555-5555-55-5', 4)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'88888888888', 2)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'88888888888', 3)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'8899457894654', 2)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'978-987-05-9354-1', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'978-987-05-9354-2', 2)
GO
INSERT [dbo].[Usuarios] ([Usuario], [contrasenia], [email], [celular], [Nombre], [Apellido], [TipoUsuario]) VALUES (N'alessawolfram', N'inspiracion', N'alejandrabarrachina23@gmail.com', N'1123870444', N'alejandra', N'barrachina', 1)
INSERT [dbo].[Usuarios] ([Usuario], [contrasenia], [email], [celular], [Nombre], [Apellido], [TipoUsuario]) VALUES (N'federicolamas', N'1234', N'federicolamas95@gmail.com', N'1123870444', N'No definido', N'No definido', 0)
INSERT [dbo].[Usuarios] ([Usuario], [contrasenia], [email], [celular], [Nombre], [Apellido], [TipoUsuario]) VALUES (N'flamas1811', N'wasdwasd472', N'fede_1811@hotmail.com', N'1139544454', N'No definido', N'No definido', 0)
GO
ALTER TABLE [dbo].[Libros] ADD  DEFAULT ((1)) FOR [ID_Formato]
GO
ALTER TABLE [dbo].[Libros] ADD  DEFAULT ('No disponible') FOR [Sinopsis]
GO
ALTER TABLE [dbo].[Libros] ADD  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[Libros] ADD  CONSTRAINT [DF_Libros_Portada]  DEFAULT ('~/img/portada/imagen-no-disponible.png') FOR [Portada]
GO
ALTER TABLE [dbo].[Libros] ADD  CONSTRAINT [DF_Libros_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ('No definido') FOR [Nombre]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ('No definido') FOR [Apellido]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [TipoUsuario]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Formato] FOREIGN KEY([ID_Formato])
REFERENCES [dbo].[Formatos] ([ID_Formato])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Formato]
GO
ALTER TABLE [dbo].[LibrosxAutores]  WITH CHECK ADD FOREIGN KEY([ID_Autor])
REFERENCES [dbo].[Autores] ([ID_Autor])
GO
ALTER TABLE [dbo].[LibrosxAutores]  WITH CHECK ADD FOREIGN KEY([ID_Autor])
REFERENCES [dbo].[Autores] ([ID_Autor])
GO
ALTER TABLE [dbo].[LibrosxEditoriales]  WITH CHECK ADD FOREIGN KEY([ID_Editorial])
REFERENCES [dbo].[Editoriales] ([ID_Editorial])
GO
ALTER TABLE [dbo].[LibrosxEditoriales]  WITH CHECK ADD FOREIGN KEY([ID_Editorial])
REFERENCES [dbo].[Editoriales] ([ID_Editorial])
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarLibro]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarLibro] @ISBN varchar(50), @Titulo varchar(200),
								 @ID_Formato int, @Sinopsis text,
								 @Fecha_Edicion int, @Portada VARCHAR(MAX), @Editorial int
AS
INSERT INTO Libros(ISBN,Titulo,ID_Formato,Sinopsis,Fecha_Edicion,Portada,ID_Editorial) 
VALUES (@ISBN,@Titulo,@ID_Formato,@Sinopsis,@Fecha_Edicion,@Portada,@Editorial)
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarLibroxAutor]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarLibroxAutor] @ISBN VARCHAR(50), @Autor int
AS
INSERT INTO LibrosxAutores(ISBN, ID_Autor) VALUES (@ISBN,@Autor)
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarLibroxEditorial]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarLibroxEditorial] @ISBN varchar(50), @CodigoEditorial int
AS
INSERT INTO LibrosxEditoriales (ISBN,ID_Editorial)VALUES(@ISBN,@CodigoEditorial)
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarUsuario]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarUsuario] @NombreUsuario varchar(20), @Contrasenia varchar(20) ,
@Email varchar(50), @Celular varchar(10) AS
INSERT INTO Usuarios (Usuario,contrasenia,email,celular) 
VALUES (@NombreUsuario,@Contrasenia,@Email,@Celular)
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarLibro]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarLibro] @ISBN varchar(50)
AS
UPDATE Libros SET Estado = 0 WHERE ISBN = @ISBN;
GO
/****** Object:  StoredProcedure [dbo].[SP_IsbnRepetido]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_IsbnRepetido] @ISBN varchar(50) AS
SELECT COUNT(*) FROM Libros WHERE ISBN = @ISBN;
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarEditoriales]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ListarEditoriales]
AS
SELECT ID_Editorial,Nombre_Editorial FROM Editoriales;
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarLibros]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarLibros] 
AS
SELECT Libros.ISBN,Titulo,Sinopsis,Libros.ID_Formato, Libros.ID_Editorial,Nombre_Editorial,Fecha_Edicion, 
Portada,Autores.ID_Autor, Autores.Nombre, Autores.Apellido from Libros 
INNER JOIN LibrosxAutores 
ON LibrosxAutores.ISBN = Libros.ISBN INNER JOIN Autores
ON Autores.ID_Autor = LibrosxAutores.ID_Autor INNER JOIN Formatos
ON Formatos.ID_Formato = Libros.ID_Formato INNER JOIN Editoriales
ON Editoriales.ID_Editorial = Libros.ID_Editorial
WHERE Estado = 1;

GO
/****** Object:  StoredProcedure [dbo].[SP_ListarUltimasEdiciones]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarUltimasEdiciones] AS
SELECT top 5 Titulo,Nombre,Apellido,Fecha_Edicion, Portada FROM Libros INNER JOIN LibrosxAutores ON Libros.ISBN = LibrosxAutores.isbn INNER JOIN
Autores ON LibrosxAutores.ID_Autor= Autores.ID_Autor WHERE Fecha_Edicion = year(getdate()) OR Fecha_Edicion = year(getdate())-1 ORDER BY Libros.Fecha_Edicion desc;
GO
/****** Object:  StoredProcedure [dbo].[SP_ModificarLibro]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ModificarLibro] @ISBN varchar(50), @Titulo varchar(200),
								 @ID_Formato int, @Sinopsis text,
								 @Fecha_Edicion int, @Portada varchar(max),@CodigoEditorial int
AS
UPDATE Libros SET Titulo = @Titulo, ID_Formato = @ID_Formato,Sinopsis=@Sinopsis,Fecha_Edicion=@Fecha_Edicion,
Portada = @Portada,ID_Editorial = @CodigoEditorial WHERE ISBN = @ISBN;
GO
/****** Object:  StoredProcedure [dbo].[SP_ModificarLibroxAutor]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ModificarLibroxAutor] @ISBN varchar(50), @CodigoAutor int
AS
UPDATE LibrosxAutores SET ID_Autor= @CodigoAutor WHERE ISBN = @ISBN
GO
/****** Object:  StoredProcedure [dbo].[SP_ModificarLibroxEditorial]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_ModificarLibroxEditorial] @ISBN varchar(50), @CodigoEditorial int
AS
UPDATE LibrosxEditoriales SET ID_Editorial=@CodigoEditorial WHERE ISBN = @ISBN
GO
/****** Object:  StoredProcedure [dbo].[SP_UsuarioLogeado]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UsuarioLogeado] @usuario varchar(20)
AS
select usuario,nombre, apellido,TipoUsuario from usuarios where Usuario=@usuario 
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarEmailExistente]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerificarEmailExistente] @email varchar(50)
as
SELECT COUNT(*) FROM Usuarios WHERE email=@email;
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarUsuario]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerificarUsuario] @usuario varchar(20), @contrasenia varchar(20) AS
select count(*) from usuarios where Usuario=@usuario AND contrasenia = @contrasenia;
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarUsuarioExistente]    Script Date: 9/12/2020 20:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_VerificarUsuarioExistente] @usuario varchar(20)
as
SELECT COUNT(*) FROM Usuarios WHERE usuario=@usuario;
GO
