USE [EdicionesElemento]
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[ID_Autor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Celular] [varchar](10) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Autores] PRIMARY KEY CLUSTERED 
(
	[ID_Autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editoriales]    Script Date: 13/12/2020 19:28:40 ******/
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
/****** Object:  Table [dbo].[Formatos]    Script Date: 13/12/2020 19:28:40 ******/
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
/****** Object:  Table [dbo].[Libros]    Script Date: 13/12/2020 19:28:40 ******/
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
/****** Object:  Table [dbo].[LibrosxAutores]    Script Date: 13/12/2020 19:28:40 ******/
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
/****** Object:  Table [dbo].[LibrosxEditoriales]    Script Date: 13/12/2020 19:28:40 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/12/2020 19:28:40 ******/
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
	[TipoUsuario] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autores] ON 

INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (1, N'Héctor', N'Oliboni', N'hectoroliboni@gmail.com', N'1145846874', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (2, N'Barbú', N'', N'barbu@gmail.com', N'1123547891', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (3, N'Pablo', N'Buol', N'pablobuol@gmail.com', N'1142246881', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (4, N'Chandika', N'', N'chandika@gmail.com', N'1155230425', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (5, N'Roberto Salvador', N'Pancaldi', N'robertopancaldi@gmail.com', N'1144115498', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (6, N'Iris', N'Cipolat', N'iricipolat@gmail.com', N'1148495243', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (7, N'Ricardo Luis', N'Flaiban', N'flaiban@gmail.com', N'1142284953', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (8, N'Américo', N'Flaiban', N'americoflaiban@gmail.com', N'1122653987', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (9, N'Peggy Beltza', N'Serrana', N'pbserrana@gmail.com', N'1145369817', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (10, N'Gabriela', N'Nicolari', N'g.nicolari@gmail.com', N'1145339925', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (11, N'Carlos', N'Drag', N'carlosdrag@gmail.com', N'1145691234', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (12, N'Jorge', N'Suárez', N'j.suarez@gmail.com', N'1154662218', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (13, N'Sebastián', N'Honores', N'shonores@gmail.com', N'1155226894', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (14, N'Susana', N'Majernik', N's.majernik@gmail.com', N'1148453312', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (15, N'Flavio Damián', N'Katzevo', N'fdamian.katzev@hotmail.com', N'1123458461', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (16, N'Laura', N'Ramella', N'lauraramella@hotmail.com', N'1123459921', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (17, N'Marcelo', N'Petrelli', N'petrelli.marcelo@gmail.com', N'1125884635', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (18, N'Gabriela', N'Renteria', N'renteria.gabriela@hotmail.com', N'1128366669', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (19, N'Leonardo', N'Killian', N'l.killian@gmail.com', N'1129573612', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (20, N'Ana Eulogia', N'Bisignani', N'anabisignani@gmail.com', N'1123668497', 1)
INSERT [dbo].[Autores] ([ID_Autor], [Nombre], [Apellido], [Email], [Celular], [Estado]) VALUES (21, N'Walter Pablo', N'Franco', N'wp.franco@gmail.com', N'1122334511', 1)
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
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'1234567891011', N'La guia de C#', 11, N'Esto es una sinopsis.', 2020, 0, N'~/img/portadas/1234567891011.jpg', 0, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'8899457894654', N'Feria Americana', 3, N'Qué me motivó a escribir este libro de cuentos cortos? Quiero, de alguna forma, dejar plasmado el reconocimiento a este grupo de personas que, por la inspiración del Padre Ale, se juntó primero para orar y luego sin proponérselo, se transformó en una fuente potencial de ayuda. 
Lo escrito, con todos sus errores y falencias, no tiene ninguna pretensión de un hecho literario: solamente narra las vivencias de esta feria americana, ya desde la óptica de una crónica, ya desde la más pura ficción.   
Inspirada en el diario tratar con la gente, que son los verdaderos protagonistas. 
No muy convencionalmente, cada cuento comienza nombrando, por su nombre de pila o su sobrenombre, a quienes han hecho posible que todos juntos vayamos aportando un granito de arena a esta montaña de carencias en la que está sumida gran parte de la sociedad. Pero, como tampoco puedo desprenderme de afectos, situaciones y personas, que forman parte de mi vida, por último dejo constancia de las primeras cosas que pudimos lograr con amor y el gran esfuerzo de esta fructuosa y larga tarea. 
Gente amiga, gente querida, les agradezco ser parte de este hermoso sueño.
', 2020, 0, N'~/img/portadas/8899457894654.jpg', 1, 2)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631049', N'Refleaccionar', 3, N'Vivimos en una cultura que nos impulsa hacia un hacer irreflexivo. Lo importante es producir y consumir. El escaso tiempo libre que nos queda, lo ocupamos, muchas veces, en programas televisivos que nos llenan de trivialidad.Así, pagamos altos costos en estrés, inefectividad y un profundo malestar causado por una frustración constante.RefleAccionar es un compendio de reflexiones para promover una acción efectiva y consciente, a fin de mejorar nuestra calidad de vida, en todos los ámbitos del actuar cotidiano.RefleAccionar es una invitación a descubrir una nueva mirada, y nuevas posibilidades de acción. No es un libro de “recetas para ser feliz”. Es una propuesta que enfoca en lo más esencial del ser humano: nuestra capacidad de pensar, sentir y actuar. En cada capítulo se aborda una temática específica con la intención de reflexionar sobre nuestra vida cotidiana y tener disponibles nuevas acciones para lograr resultados que se adecuen a nuestros propósitos', 2014, 0, N'~/img/portadas/9789871631049.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631070', N'Resonancia Cósmica', 5, N'Inspiro… exhalo…Y así como relajo mi cuerpo, suelto mis emociones al descanso que da el saber, que todos conformamos en el espacio infinito, un solo cuerpo cósmico. Y tu presencia es en mi, y yo en ti…Te respiro Dios mío. Y me das la confianza de saber que nada existe en el afuera que pueda completarme. Aún cuando se levanten en mi mente, las olas agigantadas de mis emociones. Libérame del apego de creer en mi limitación. Libérame de la creencia de ser una mitad. Enciende en mi mente la certeza de saber, que cada uno de los que me rodea en este universo multicolor, brilla con su propia luz, su propio color y forma. ¡Y ello habla de la inconmensurable belleza de tu creatividad!¡Oh dios! Bendíceme con tanto amor…Para que aprenda a vivir en medio de las diferencias y sentir la alegría del encuentro con respeto y honorabilidad. Y así danzar la vida. Compartiéndonos. En ti…Y despierto a esta verdad suprema: reconocer detrás del juego de luces y sombras de innumerables rostros humanos, tu presencia gloriosa rodeándome. Y muy dentro, en todas mis cavidades, en todos mis espacios internos. Tu presencia gloriosa respirándome. La práctica de la Resonancia Cósmica nos…CENTRA EN NUESTRO EJE DIVINO,NOS MANTIENE VIBRANTES EN DIOSENLAZA NUESTRA MENTE DESDE LA TERCERA DIMENSIÓNELEVÁNDOLA HACIA LA CUARTA.Y así como cuando ponemos agua en un tintero colmado de tinta. Empieza a desbordarse su color oscuro hasta salir agua clara. Así… se van BORRANDO LAS HUELLAS DE LAS VOCES NEGATIVASQUE SE NOS HAN GRABADOPARA DESPERTAR, RECORDARY SOLTAR EL PROCESO DE IDENTIFICACIÓN DE LOS POLOS OPUESTOSPARA ALINEARNOS CON NUESTRO YO SUPERIORY EN DIOS TODO.', 2014, 0, N'~/img/portadas/9789871631070.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631094', N'Puntito Rojo', 8, N'Sinopsis no disponible.', 2014, 0, N'~/img/portadas/9789871631094.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631100', N'Mujer Levántate', 3, N'¿Cuántos mensajes recibimos a diario las mujeres? ¿Cuántos mensajes permanentes a no aceptarnos como somos para tratar de ser perfectas a la vista del otro? Sólo exigencias. ¿Cuántas obligaciones de “estar en todo”, “poderlo todo”? Lejos nos deja esto de poder alcanzar la felicidad. Iris Cipolat a través de este libro, nos exhorta… pero no a soñar con imposibles o a convertirnos en heroínas, sino que nos invita a entender que muchos de los mandatos que heredamos nos condicionan y nos rigen; muchas cosas que nos pasan las podemos cambiar haciendo una introspección profunda, proponiéndonos un enfoque diferente para despertar nuestro yo interior donde radica el poder. Bebiendo de la fuente más genuina: la vida misma y todos sus avatares, Iris insiste en que si buceamos dentro nuestro podremos darnos cuenta de que sólo está en nuestra decisión romper nuestro molde para que pueda salir la mujer verdadera, la más completa, aquella que puede plantearse y lograr sus objetivos. Mujer levántate… todo está en ti” es un empujón a que confiemos en nosotras mismas, en nuestro instinto; es una mirada atenta a nuestros pensamientos y sentimientos, un análisis ineludible que nos lleva a querer renacer. Adentro de cada una de nosotras, vive una mujer de éxito, capaz de todo lo que se proponga, bella, con ideas e iniciativa. Iris, con este trabajo, nos invita a descubrirla.', 2014, 0, N'~/img/portadas/9789871631100.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631186', N'La Palabra', 3, N'La palabra reúne el pensamiento de su autor, en forma de pantallazos. Fotografías de distintas épocas y lugares, recuerdos que despiertan sentimientos. Sentimientos que generan reflexiones. A lo largo de muchos años, Américo Flaiban, el autor de estas páginas, escribió cartas... a sus amigos, a los parientes, a las personas que fue conociendo en su carrera como militar, como docente, como padre, jefe, hermano, hijo, abuelo ¡¡bisabuelo!! Y ahora esas cartas, que tuvieron un motivo y un receptor, se han universalizado para este libro. En ''La Palabra'', confluyen ideas y consejos, sentimientos, anhelos, sueños... palabras de consuelo, verdades, amor y también poesías. Sin pretender emular a nadie, Américo coincide con Borges, que no concebía un mundo sin libros. Para él, es la palabra -célula madre de las oraciones y los libros- la que da forma a esta sociedad... declara la guerra o la paz, anuncia un nacimiento, dice te quiero, perdón, gracias. Todo, absolutamente todo, es puesto de manifiesto a través de las palabras. En estas páginas, que deberían dejarse fluir sin llevar un orden de lectura, cada título es un disparador, un refugio de palabras para leer y saborear.', 2012, 0, N'~/img/portadas/9789871631186.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631315', N'Español por imágenes', 5, N'Material y trabajos de clase para la enseñanza y el aprendizaje de lenguas/Gramática y vocabulario.', 2019, 0, N'~/img/portadas/9789871631315.jpg', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631346', N'De Dorapa II', 8, N'El mundo -socialmente hablando- tiene sus generalidades, pero cada comunidad tiene sus particularidades. El café.. más propiamente el cafetín de Buenos Aires, queriendo o porque el rodar del "crisol de razas" así lo estableció, se convirtió en el lugar apropiado para filosofar; tal vez una cierta filosofía de color gris ausencia, pero filosofía la fin. Y entre trago y trago de un "diluyente" alcohol barato y una "angustia neblinosa" de un Buenos Aires húmedo y una "sequedad" de la inmigración se han ido constituyendo en un tartán ciudadano a una temática casi doméstica: una sarta de conceptualizaciones, incógnitas e irresoluciones diarias, mezcladas con el recuerdo de alguna mina -casi siempre casquivana- y el héroe deportiva (preferentemente futbolero) o el acogotamiento virtual del político escurridizo (preferentemente ministro de economía o del interior) van dando origen al tratamiento científico de la episteme, se convierte en una doxa cosmopolita que por algo hace sentir a esta geografía pampeana-portuaria como si se tratara de las costas de Mileto, de Atenas o de Siracusa, es decir, caseras.Claro que a la globalización mediante ese tedio esclarecedor que brinda el filosofar se hace arduo el poderlo mantener, pero como todo criollo siempre le encuentra la vuelta para poder escabullir la legislación -sobre todo la que se implantó con malicia-, aunque sea de parado, o peor, transitando por la calle en una desordenada imposición laboral y para seguir integrados socialmente, no por ello este mayoritario conjunto humano sudaca, nostálgico y mundano no dejará de continuar esclareciendo sus ideas -inmediatas y mediatas- tomando más de lo sabiondo que de lo suicida, para poder sobrellevar la diariedad que le aporta el hábitat.Y en la rápida sucesión de idas y venidas, tal vez en De Dorapa, se puedan encontrar algunas tendencias cómplices de esas inquietudes que, si bien son propuestas desde la generalidad, sólo encuentran convencimiento desde la actitud de la popularidad.', 2013, 0, N'~/img/portadas/9789871631346.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631421', N'De Dorapa III', 6, N'En el derrotero lógico de la creación y acumulación –asociativa o no- de las costumbres, el ser humano ha ido tomando, transformando y olvidando unas en pos de otras. Pareciera que es el único que en el desenvolvimiento adaptativo de la doble convivencia: con el medio y con sus propios pares, está la plasticidad del cambio de la actividad y de la forma de actuación. Las costumbres, en la observación de toda la cadena biológica -al menos desde el punto de vista evolutivo- es en el hombre donde toman una importancia trascendental y, dentro de la filosofía son estudiadas por la ética. Si bien la ciencia nace por el filosofar sobre el por qué, el para qué y el cómo -siendo, sin lugar a dudas, el por qué el ejecutivo de este triunviro- casi en conjunción con estas “contemplaciones” surge la prima hermana de lo que está bien y de lo que está mal; es más, a lo propiamente preguntón del por qué le antecede la preocupación de la acción correcta o incorrecta y esto ya no es tan propio del filosofar sino de la convivencia misma. La sociedad humana, en su actividad, genera las acciones consideradas como buenas o como malas para el grupo: las buenas se deben enaltecer y emular y las malas se deben prohibir y censurar. Frente a cada hecho, entonces, se generará una acción correcta o una acción incorrecta; con el devenir de la repetición, por un lado se emparentará con la virtud y, por el otro, con el delito, pero que cualquiera de ellas formará costumbres. Y la “contemplación” sobre ellas, anterior a la filosofía misma, ya aparece en las primitivas teologías.(Segmento del capítulo “De la palabra empeñada”)', 2014, 0, N'~/img/portadas/9789871631421.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631544', N'Luces sobre el Uritorco', 8, N'En la noche del 9 de enero de 1986, tres testigos observaron el desplazamiento, a muy baja altura, de un objeto circular de dimensiones gigantescas, que en su camino iluminó las sierras de Pajarillo como si hubiera salido el sol. A la mañana siguiente, el autor de ese libro entrevistó a los testigos y fue una de las primeras personas que tomó contacto con la huella circular de cien metros de diámetro, provocada doce horas antes por el OVNI.A partir de ese momento, el caso Huella del Pajarillo generó una cobertura periodística sin precedentes y, con el tiempo, fue objeto de estudio de los principales investigadores de la temática OVNI de la Argentina y el exterior. Uno de los visitantes más prestigiosos que tuvo la huella fue el escritor español Juan José Benítez, quien la investigó en 1989 acompañado por el doctor Fernando Jiménez del Oso. Pero para Jorge Suárez este caso significó un profundo cambio en sus concepciones sobre la temática OVNI, que lo llevaron a convertirse en uno de los investigadores más consecuentes de los fenómenos que suceden continuamente en el Cerro Uritorco. Este libro relata este caso y otros, que han convertido al Cerro Uritorco (ubicado al noroeste de la provincia de Córdoba, frente a la localidad de Capilla de Monte), en uno de los principales centros de convocatoria espiritual y en una “zona caliente” para la casuística OVNI.', 2016, 0, N'~/img/portadas/9789871631544.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631759', N'Viajando por el metal', 3, N'Sebastian Honores se proclama un tipo común, de hecho… lo es. Pero logró cumplir el sueño de muchos… recorrer los mejores festivales Europeos! Desde el HellFest hasta el Download Fest y tantos más.
Toda esta experiencia en los recitales que lo vieron pasar quedaron plasmadas en su libro “Viajando por el metal” (experiencias de un metalero cordobés en los festivales europeos) que acaba de lanzarse a través de la Editorial Elemento. 
Este libro que tan gentilmente hizo llegar a las manos del equipo de CUERO Y METAL, hace un repaso de sus recitales y experiencias en Córdoba, Argentina, Chile y Europa. Un viaje increíble para todo aquel que siente esta música que tanto nos representa y nos llega al núcleo de nuestro cuerpo. Un material de lectura fácil y con una cuota de pasión única que te hará no dejar de leer hasta dar por finalizado este tour de un hermano del metal que cumple su sueño pendejo de ayer.', 2020, 0, N'~/img/portadas/9789871631759.jpg', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631766', N'Mi vida a través de mis recetas', 3, N'Sinopsis no disponible.', 2020, 0, N'~/img/portadas/9789871631766.png', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789871631773', N'De dorapa VIII', 5, N'Lo hizo de nuevo. Carlos Drag, en esta colección de filosofía rápida, nos revisa y obliga a dialogar con nuestros propios pensamientos, a veces luminosos, a veces no tanto.', 2020, 0, N'~/img/portadas/9789871631773.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789873408762', N'Amantes Subterráneos, el rock under de los 80', 3, N'Para aquellos que vivieron los años ochenta como “su época” este trabajo de Flavio será un recorrer con la memoria sonidos, visiones, lugares y también amores. Para los que no… para los que “su época” estuvo antes o después en la línea del tiempo, Amantes subterráneos pintará un panorama de cómo funcionaron las cosas en este país, tras la caída de los militares y durante los primeros años de la democracia. El rock under, el que a duras penas se sustentaba, el que a duras penas sustentábamos pagando la entrada –cuando no podíamos zafar, obvio-, compartiendo los demos, alentando a los músicos. Como espectadores no hicimos mucho más. O sí. Vivimos, sin lugar a dudas, la época en que -sin Internet, ni celular, ni compre-ya-, pudimos acceder a todos los géneros, todos los estilos, cada quien con su look y su forma de pensar. Los ochenta se presentaron como un abanico multicultural, multiétnico. Punks en La Capilla, chicas freak en Cemento, cualquiera en Prix D´ami escuchando a Alphonso S´entrega o a JAF. Amantes Subterráneos es una recopilación generosa, un reencuentro con aquello que no murió, porque está siempre con nosotros.', 2014, 0, N'~/img/portadas/9789873408762.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789873410512', N'De Dorapa', 3, N'El mundo -socialmente hablando- tiene sus generalidades, pero cada comunidad tiene sus particularidades. El café... más propiamente el cafetín de Buenos Aires, queriendo o porque el rodar del ''crisol de razas'' así lo estableció, se convirtió en el lugar apropiado para filosofar; tal vez una cierta filosofía de color gris ausencia, pero filosofía la fin. Y entre trago y trago de un ''diluyente'' alcohol barato y una ''angustia neblinosa'' de un Buenos Aires húmedo y una ''sequedad'' de la inmigración se han ido constituyendo en un tartán ciudadano a una temática casi doméstica: una sarta de conceptualizaciones, incógnitas e irresoluciones diarias, mezcladas con el recuerdo de alguna mina -casi siempre casquivana- y el héroe deportiva (preferentemente futbolero) o el acogotamiento virtual del político escurridizo (preferentemente ministro de economía o del interior) van dando origen al tratamiento científico de la episteme, se convierte en una doxa cosmopolita que por algo hace sentir a esta geografía pampeana-portuaria como si se tratara de las costas de Mileto, de Atenas o de Siracusa, es decir, caseras. Claro que a la globalización mediante ese tedio esclarecedor que brinda el filosofar se hace arduo el poderlo mantener, pero como todo criollo siempre le encuentra la vuelta para poder escabullir la legislación -sobre todo la que se implantó con malicia-, aunque sea de parado, o peor, transitando por la calle en una desordenada imposición laboral y para seguir integrados socialmente, no por ello este mayoritario conjunto humano sudaca, nostálgico y mundano no dejará de continuar esclareciendo sus ideas -inmediatas y mediatas- tomando más de lo sabiondo que de lo suicida, para poder sobrellevar la diariedad que le aporta el hábitat. Y en la rápida sucesión de idas y venidas, tal vez en De Dorapa, se puedan encontrar algunas tendencias cómplices de esas inquietudes que, si bien son propuestas desde la generalidad, sólo encuentran convencimiento desde la actitud de la popularidad.', 2011, 0, N'~/img/portadas/9789873410512.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789873414169', N'Valoracion I: Valoración aduanera de mercadería de importación', 3, N'Si bien el trabajo de Peggy Beltza se redactó con la mirada puesta en sus cátedras, este trabajo excede su primera intención. Valoración I, es una herramienta útil para comprender los pormenores de del Artículo 7 del Acuerdo General sobre Aranceles Aduaneros y Comercio (GATT). Y más, porque lo vincula acertadamente con la Ley 23.311, que a su vez trabaja en concordancia con el Decreto Reglamentario Nº 1026/87. Conocedora a fondo de la aplicabilidad del Código Aduanero Argentino y con años de experiencia como despachante de aduana primero y como docente después, la ''profe'' aporta en este texto la claridad necesaria como para emprender un tema tan controversial y a simple vista complicado.', 2012, 0, N'~/img/portadas/9789873414169.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789873414176', N'Huellas en discordia', 3, N'Huellas en discordia es un conjunto de narraciones que expresa la determinación que siempre tiene el hombre en escribir una sola historia. La discordia cobra forma de huella cuando otras razas, especies e inclusos células, gérmenes y parásitos se esfuerzan para conservar sus costumbres. La discordia se convierte en guerra cuando las huellas se superponen. Una guerra ciega de horror y sorda de perdón. Una paz carente de olfato para seguir el rastro a la huella pura. Una lectura sin rumbo cierto.Entre las narraciones, se resaltan “La Receta” y “El Huérfano”, dos novelas cortas que se pueden leer por separado, pero sirven de nexo entre “El narrador”, libro anterior del autor, y “El orador”, el próximo a publicarse.Leer a un autor, que se proclama ser de otra especie, es una invitación a protestar con el pensamiento establecido. Es una invitación a disfrutar y soñar con que otro mundo es posible.', 2012, 0, N'~/img/portadas/9789873414176.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789873414367', N'Teatro II', 4, N'Recordar y repetir parecen ser dos de los mecanismos míticos del teatro; esa especie de celebración ritual de la memoria. Un acto de herencia perpetua que toma su energía desde esa misma memoria viva o desde los diferentes soportes que así la mantienen. En el teatro todo lo dado antes fue recibido. De allí el valor de los testamentos, esos documentos que los reasignan y reparten. Dionisio, el programa radial de Héctor Oliboni -y su revista- son un perfecto ejemplo de lo que –durante dos décadas nada menos- pueden hacer esos soportes. Un medio –en su sentido literal, el de mediar entre dos- que viene portando (y aportando) la experiencia escénica de una generación de artistas a la otra. De cabeza en cabeza. Y como siempre en el teatro en su maravillosa conversión de norma: de esa cabeza iluminada a un cuerpo emocionado. Dionisio ha sido en estos 20 años un perfecto arte-facto teatral.', 2012, 0, N'~/img/portadas/9789873414367.png', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789873414584', N'Comprender el cosmos', 5, N'Todo lo que acontece en el universo puede ser estudiado mediante un conjunto finito de leyes -a través de axiomas, reglas, postulados, principios, etcétera- todas ellas de carácter muy simple y a través de las cuales pueden enunciarse otras más complejas. Este conjunto finito de leyes es de carácter exacto pues todos los fenómenos de la naturaleza y su comportamiento pueden ser expresados a través de la Matemática y otras ciencias afines con ésta. Partiendo de esta base, el autor desmenuza temas complejos y hasta fantásticos a nuestros ojos y nos acerca a las más recientes teorías científicas con un lenguaje relativamente sencillo. Los agujeros negros, los planteas huecos, la teoría de las cuerdas y hasta la teletransportación tienen lugar en Cosmos, el trabajo de Ricardo Flaiban para comprender mejor el Universo en que vivimos.', 2012, 0, N'~/img/portadas/9789873414584.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789873414978', N'Cuentos Pintados', 3, N'Atrapados en su propio laberinto, soñadoras empedernidas, psicópatas y psicopateados... todos están en los cuentos de Gabriela. A través de estos relatos, la autora nos deja espiar la vida de algunas personas, muy parecidas a nosotros mismos y a la vez, tan lejanas. Leerlos en ponerse un rato en la piel de ese otro, que nos seduce y nos atemoriza ¡a veces las dos cosas a la vez! Los hombres y mujeres que desfilan en estas páginas, constituyen la excusa para bucear en el alma humana, por las aguas sensibles de una mujer joven que, compu a mano, evidencia un profundo conocimiento del espíritu de sus congéneres.', 2012, 0, N'~/img/portadas/9789873414978.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789873426629', N'La fuga del tiempo', 8, N'El tiempo marca nuestras vidas, gobierna nuestra ansiedad. Vivimos condicionados por él. Un minuto puede ser la delgada línea de una llegada tarde al trabajo. Un segundo puede ser determinante para cambiar un resultado en un deporte. El tiempo es un señalador en un libro. Él es nuestro reflejo en un espejo. Sin él no podemos desarrollar nuestros sentidos. Sí él no existiera, el hambre no sería una preocupación. El tiempo nos regala momentos felices que recordar y nos castiga con momentos tristes que no podemos olvidar. El tiempo nos da espacio para pensar: ¿El tiempo envejece junto con nosotros? ¿El tiempo se detiene cuando morimos? ¿Existe la muerte sin un cuerpo? El tiempo siempre está presente y no hay religión en el mundo que le rinda culto. "La Fuga del Tiempo" esta compuesto por cuatro narraciones donde el tiempo es el protagonista y el hombre la víctima. El tiempo se escapa. ¿Qué hará el hombre sin él?', 2016, 0, N'~/img/portadas/9789873426629.PNG', 1, 1)
INSERT [dbo].[Libros] ([ISBN], [Titulo], [ID_Formato], [Sinopsis], [Fecha_Edicion], [Precio], [Portada], [Estado], [ID_Editorial]) VALUES (N'9789974530065', N'El grito de las estrellas: huellas y contactos', 3, N'Sinopsis no disponible', 2020, 0, N'~/img/portadas/9789974530065.PNG', 1, 1)
GO
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'1234567891011', 1)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631049', 3)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631070', 4)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631094', 5)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631100', 6)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631186', 8)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631315', 16)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631346', 11)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631421', 11)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631544', 12)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631759', 13)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631766', 14)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789871631773', 11)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789873408762', 15)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789873410512', 11)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789873414169', 9)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789873414176', 2)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789873414367', 1)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789873414584', 7)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789873414978', 10)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789873426629', 2)
INSERT [dbo].[LibrosxAutores] ([ISBN], [ID_Autor]) VALUES (N'9789974530065', 12)
GO
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'111-111-1111-10-0', 4)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'111-111-1111-10-2', 4)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'111-111-1111-12-5', 3)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'1122334455668', 2)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'1122334455677', 2)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'1122334455971', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'1234567891011', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'555-555-5555-55-5', 4)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'88888888888', 2)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'88888888888', 3)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'8899457894654', 2)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'978-987-05-9354-1', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'978-987-05-9354-2', 2)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631049', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631070', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631094', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631100', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631186', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631315', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631346', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631421', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631544', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631759', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631766', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789871631773', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789873408762', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789873410512', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789873414169', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789873414176', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789873414367', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789873414584', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789873414978', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789873426629', 1)
INSERT [dbo].[LibrosxEditoriales] ([ISBN], [ID_Editorial]) VALUES (N'9789974530065', 1)
GO
INSERT [dbo].[Usuarios] ([Usuario], [contrasenia], [email], [celular], [Nombre], [Apellido], [TipoUsuario]) VALUES (N'12345678910', N'558877446699', N'alejandra@prueba.com', N'1123987046', N'No definido', N'No definido', 0)
INSERT [dbo].[Usuarios] ([Usuario], [contrasenia], [email], [celular], [Nombre], [Apellido], [TipoUsuario]) VALUES (N'alessalameneadora', N'5588465468', N'ale23_barra@hotmail.com', N'1123884465', N'No definido', N'No definido', 0)
INSERT [dbo].[Usuarios] ([Usuario], [contrasenia], [email], [celular], [Nombre], [Apellido], [TipoUsuario]) VALUES (N'alessawolfram', N'1234567891', N'alejandrabarrachina23@gmail.com', N'1123870444', N'Alejandra', N'Barrachina', 1)
INSERT [dbo].[Usuarios] ([Usuario], [contrasenia], [email], [celular], [Nombre], [Apellido], [TipoUsuario]) VALUES (N'alessitawolfs', N'1234', N'ale@afds.com', N'1123874654', N'No definido', N'No definido', 0)
INSERT [dbo].[Usuarios] ([Usuario], [contrasenia], [email], [celular], [Nombre], [Apellido], [TipoUsuario]) VALUES (N'federicolamas', N'wasd', N'federicolamas95@gmail.com', N'1123870444', N'No definido', N'No definido', 0)
INSERT [dbo].[Usuarios] ([Usuario], [contrasenia], [email], [celular], [Nombre], [Apellido], [TipoUsuario]) VALUES (N'holaquehaces', N'2244668899', N'fede_1811@hotmail.com', N'1123846456', N'No definido', N'No definido', 0)
INSERT [dbo].[Usuarios] ([Usuario], [contrasenia], [email], [celular], [Nombre], [Apellido], [TipoUsuario]) VALUES (N'joacomiramar', N'123456789101', N'ale@afds', N'1123456546', N'No definido', N'No definido', 0)
INSERT [dbo].[Usuarios] ([Usuario], [contrasenia], [email], [celular], [Nombre], [Apellido], [TipoUsuario]) VALUES (N'UsuarioCargado', N'estaesmicontrasenia', N'user@gmail.com', N'1125369974', N'No definido', N'No definido', 0)
GO
ALTER TABLE [dbo].[Autores] ADD  DEFAULT ((1)) FOR [Estado]
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
ALTER TABLE [dbo].[LibrosxAutores]  WITH CHECK ADD FOREIGN KEY([ISBN])
REFERENCES [dbo].[Libros] ([ISBN])
GO
ALTER TABLE [dbo].[LibrosxEditoriales]  WITH CHECK ADD FOREIGN KEY([ID_Editorial])
REFERENCES [dbo].[Editoriales] ([ID_Editorial])
GO
ALTER TABLE [dbo].[LibrosxEditoriales]  WITH CHECK ADD FOREIGN KEY([ID_Editorial])
REFERENCES [dbo].[Editoriales] ([ID_Editorial])
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarAutor]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarAutor] @Nombre varchar(50),@apellido varchar(50),@celular varchar(10), @email varchar(50)
AS
INSERT INTO Autores (Nombre,Apellido,Celular,Email) VALUES (@Nombre,@apellido,@celular,@email);
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarLibro]    Script Date: 13/12/2020 19:28:40 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_AgregarLibroxAutor]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarLibroxAutor] @ISBN VARCHAR(50), @Autor int
AS
INSERT INTO LibrosxAutores(ISBN, ID_Autor) VALUES (@ISBN,@Autor)
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarLibroxEditorial]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarLibroxEditorial] @ISBN varchar(50), @CodigoEditorial int
AS
INSERT INTO LibrosxEditoriales (ISBN,ID_Editorial)VALUES(@ISBN,@CodigoEditorial)
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarUsuario]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarUsuario] @NombreUsuario varchar(20), @Contrasenia varchar(20) ,
@Email varchar(50), @Celular varchar(10) AS
INSERT INTO Usuarios (Usuario,contrasenia,email,celular) 
VALUES (@NombreUsuario,@Contrasenia,@Email,@Celular)
GO
/****** Object:  StoredProcedure [dbo].[SP_AutorSeleccionado]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AutorSeleccionado] @CodigoAutor int
AS
select * from autores WHERE ID_Autor=@CodigoAutor
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarAutor]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarAutor] @CodigoAutor int
AS
UPDATE Autores SET Estado = 0 WHERE ID_Autor = @CodigoAutor;
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarLibro]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarLibro] @ISBN varchar(50)
AS
UPDATE Libros SET Estado = 0 WHERE ISBN = @ISBN;
GO
/****** Object:  StoredProcedure [dbo].[SP_IsbnRepetido]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_IsbnRepetido] @ISBN varchar(50) AS
SELECT COUNT(*) FROM Libros WHERE ISBN = @ISBN;
GO
/****** Object:  StoredProcedure [dbo].[SP_LibroSeleccionado]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LibroSeleccionado] @ISBN VARCHAR(50)
AS
SELECT Libros.ISBN,Titulo,Sinopsis,Libros.ID_Formato, Libros.ID_Editorial,Nombre_Editorial,Fecha_Edicion, 
Portada,Autores.ID_Autor, Autores.Nombre, Autores.Apellido from Libros 
INNER JOIN LibrosxAutores 
ON LibrosxAutores.ISBN = Libros.ISBN INNER JOIN Autores
ON Autores.ID_Autor = LibrosxAutores.ID_Autor INNER JOIN Formatos
ON Formatos.ID_Formato = Libros.ID_Formato INNER JOIN Editoriales
ON Editoriales.ID_Editorial = Libros.ID_Editorial
WHERE Libros.Estado = 1 AND Libros.ISBN=@ISBN;
GO
/****** Object:  StoredProcedure [dbo].[SP_ListadoAutores]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListadoAutores]
AS
SELECT ID_Autor,Nombre,Apellido,Celular,Email FROM Autores WHERE Estado = 1

execute SP_ListadoAutores
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarEditoriales]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ListarEditoriales]
AS
SELECT ID_Editorial,Nombre_Editorial FROM Editoriales;
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarLibros]    Script Date: 13/12/2020 19:28:40 ******/
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
WHERE Libros.Estado = 1;
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarUltimasEdiciones]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarUltimasEdiciones] AS
SELECT top 5 Titulo,Nombre,Apellido,Fecha_Edicion, Portada FROM Libros INNER JOIN LibrosxAutores ON Libros.ISBN = LibrosxAutores.isbn INNER JOIN
Autores ON LibrosxAutores.ID_Autor= Autores.ID_Autor WHERE libros.Estado = 1 AND Fecha_Edicion = year(getdate()) OR Fecha_Edicion = year(getdate())-1 ORDER BY Libros.Fecha_Edicion desc;
GO
/****** Object:  StoredProcedure [dbo].[SP_ModificarAutor]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ModificarAutor] @CodigoAutor int,@nombre varchar(50), @apellido varchar(50),@celular varchar(10)
,@email varchar(50)
AS
UPDATE Autores SET Nombre=@nombre, Apellido=@apellido, Email=@email, Celular=@celular WHERE ID_Autor=@CodigoAutor
GO
/****** Object:  StoredProcedure [dbo].[SP_ModificarLibro]    Script Date: 13/12/2020 19:28:40 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ModificarLibroxAutor]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ModificarLibroxAutor] @ISBN varchar(50), @CodigoAutor int
AS
UPDATE LibrosxAutores SET ID_Autor= @CodigoAutor WHERE ISBN = @ISBN
GO
/****** Object:  StoredProcedure [dbo].[SP_ModificarLibroxEditorial]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_ModificarLibroxEditorial] @ISBN varchar(50), @CodigoEditorial int
AS
UPDATE LibrosxEditoriales SET ID_Editorial=@CodigoEditorial WHERE ISBN = @ISBN
GO
/****** Object:  StoredProcedure [dbo].[SP_ModificarUsuario]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ModificarUsuario] @NombreUsuario varchar(20),@Nombre varchar(50), @Apellido varchar(50),
@celular varchar(10), @email varchar(50), @contrasenia varchar(20) AS
UPDATE Usuarios SET contrasenia=@contrasenia, email=@email, celular=@celular,Nombre=@nombre,Apellido=@apellido
WHERE Usuario = @NombreUsuario;
GO
/****** Object:  StoredProcedure [dbo].[SP_RestablecerContrasenia]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RestablecerContrasenia] @email VARCHAR(50)
AS
SELECT Usuario,contrasenia,email,nombre, apellido from Usuarios WHERE 
email = @email
GO
/****** Object:  StoredProcedure [dbo].[SP_UltimoIdAutores]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UltimoIdAutores] as
select count(*) from Autores;
GO
/****** Object:  StoredProcedure [dbo].[SP_UsuarioLogeado]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UsuarioLogeado] @usuario varchar(20),@contrasenia varchar(20)
AS
select usuario,nombre, apellido,TipoUsuario,contrasenia,email,celular from usuarios where Usuario=@usuario AND
contrasenia=@contrasenia
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarEmailExistente]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerificarEmailExistente] @email varchar(50), @nombreUsuario varchar(20)
as
SELECT COUNT(*) FROM Usuarios where email NOT IN (select email from Usuarios where Usuario=@nombreUsuario)
AND email = @email;
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarUsuario]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VerificarUsuario] @usuario varchar(20), @contrasenia varchar(20) AS
select count(*) from usuarios where Usuario=@usuario AND contrasenia = @contrasenia;
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarUsuarioExistente]    Script Date: 13/12/2020 19:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_VerificarUsuarioExistente] @usuario varchar(20)
as
SELECT COUNT(*) FROM Usuarios WHERE usuario=@usuario;
GO
