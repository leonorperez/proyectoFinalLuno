package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dataBase.ConexionDB;
import model.Provincia;
import model.Usuario;

/**
 * DAO de tabla Provincias
 * 
 * @author Leonor
 *
 */

public class ProvinciaDAO2 {

	/**
	 * Lista todas las provincias de la table Provincia;
	 * 
	 * @return List de objetos {@link Provincia}
	 * @throws SQLException
	 */
	public List<Provincia> listarProvincias() throws SQLException {
		ConexionDB conexionDB = new ConexionDB();
		Statement st = conexionDB.crearStatement();

		// ejecuto la consulta sql para traer todas las provincias
		// coloco el resultado de la consulta en rs
		// rs tiene un listado con todos los usuarios
		ResultSet rs = st.executeQuery("SELECT * FROM provincias");
		List<Provincia> listProv = new ArrayList<Provincia>();

		// recorro rs fila por fila
		// creo un obj Provincia x cada fila para respetar el POO
		while (rs.next()) {
			Provincia prov = new Provincia(rs.getInt("idprovincia"), rs.getString("nombre"));
			listProv.add(prov);

		}

		return listProv;
	}

	/**
	 * Inserta una provincia en la tabla provincias
	 * 
	 * @param nombre Nombre de la provincia a insertar.
	 * @return true si insertó y false si no.
	 * @throws SQLException
	 */
	public Boolean addProvincia(String nombre) throws SQLException {
		Boolean existeProvincia= this.existeProvincia(nombre);

		if(existeProvincia) {
			return false;
		}else {
		ConexionDB con = new ConexionDB();
		Statement st = con.crearStatement();

		Integer insertOk = st.executeUpdate("INSERT INTO provincias (nombre) VALUES('" + nombre + "')");

		return insertOk == 1;
		}
		
	}

	/**
	 * Verifica si existe la provincia a insertar
	 * 
	 * @param nombre String nombre de la provincia
	 * @return true si existe o false sino.
	 * @throws SQLException 
	 */ 
	public Boolean existeProvincia(String nombre) throws SQLException {
		ConexionDB con = new ConexionDB();
		Statement st = con.crearStatement();
		
		ResultSet rs = st.executeQuery("SELECT * FROM provincias WHERE nombre='"+nombre+"'");

		return rs.next();
	}
	
	public Boolean updProvincia(Integer idProv, String nombre) throws SQLException {
		ConexionDB con = new ConexionDB();
		Statement st= con.crearStatement();
		
		Integer cantUpd = st.executeUpdate("UPDATE provincias SET nombre='"+nombre+"' WHERE idProvincia='"+idProv+"'");
		
		return cantUpd == 1;
	}
}
