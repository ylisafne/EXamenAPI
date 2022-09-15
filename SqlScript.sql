CREATE TABLE [dbo].[persona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[dni] [varchar](8) NOT NULL,
	[fecNacimiento] [date] NULL,
	[fecRegistro] [date] NULL,
	[direccion] [varchar](100) NULL,
	[estado] [bit] NOT NULL,
	[fecUltAct] [date] NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_Persona_Del]    Script Date: 15/09/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Persona_Del]
	@id	int
AS
BEGIN
	/*BORRADO LOGICO*/
	UPDATE persona
	set		estado = 0,
			fecUltAct = getdate()
	where	id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Persona_List]    Script Date: 15/09/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Persona_List]
	@id		int
	AS
BEGIN
	SELECT	id,
			nombre,
			apellido,
			dni,
			convert(varchar, fecNacimiento, 103) fecNacimiento,
			fecRegistro,
			direccion,
			estado,
			fecUltAct
	FROM	persona
	WHERE	id = ISNULL(@id, id)
	AND		estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Persona_Reg]    Script Date: 15/09/2022 11:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Persona_Reg]
	@id					int,
	@nombre				varchar(50),
	@apellido			varchar(50),
	@dni				varchar(8),
	@fecNacimiento		date,
	@direccion			varchar(100),
	@estado				bit
	AS
BEGIN
	-- EXEC sp_Persona_reg 1, 'GABRIEL', 'SILVERIO', '12345678', '01-09-2022', 'av las ...', 1
	
	MERGE persona as T
	USING (SELECT	@id					id,
					@nombre				nombre,
					@apellido			apellido,
					@dni				dni,			
					convert(date, @fecNacimiento, 103) fecNacimiento,
					@direccion			direccion,
					@estado				estado) as S
	ON (T.id = S.id)
	WHEN MATCHED AND @estado = 1 THEN
		UPDATE 
		SET	nombre			= isnull(s.nombre, t.nombre),
			apellido		= isnull(s.apellido, t.apellido),
			dni				= isnull(s.dni, t.dni),
			fecNacimiento	= isnull(s.fecNacimiento, t.fecNacimiento),
			direccion		= isnull(s.direccion, t.direccion),
			estado			= s.estado,
			fecUltAct		= getdate()
	WHEN NOT MATCHED THEN 
		INSERT (nombre,
				apellido,
				dni,
				fecNacimiento,
				fecRegistro,
				direccion,
				estado)
		VALUES( S.nombre,
				S.apellido,
				S.dni,
				S.fecNacimiento,
				GETDATE(),
				S.direccion,
				S.estado);
END
GO
