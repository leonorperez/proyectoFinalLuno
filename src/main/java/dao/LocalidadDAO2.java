package dao;

import java.sql.SQLException;
import java.sql.Statement;

import dataBase.ConexionDB;

/**
 * Concentra todas las crud de la tabla localidad
 * @author Leonor
 *
 */
public class LocalidadDAO2 {

	public Boolean addLocalidad(String nombre, Integer idProv) throws SQLException {
		//TODO: verificar q no se repita loclidad provincia
		
		ConexionDB con = new ConexionDB();
		Statement st = con.crearStatement();
		Integer insertOk = st.executeUpdate("INSERT INTO localidades (nombre, idProvincia) VALUES ('"+nombre+"',"+idProv+") ");
		
		return insertOk ==1;

	}
}
