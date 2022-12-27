package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dataBase.ConexionDB;
import model.Localidad;
import model.Provincia;

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
		Integer insertOk = st.executeUpdate("INSERT INTO localidades (nombre, idProvincia) VALUES ('"+nombre+"',"+idProv+")");
		
		return insertOk ==1;

	}
	/**
	 * Lista todas las localidades de la table Localidades;
	 * 
	 * @return List de objetos {@link Localidad}
	 * @throws SQLException
	 */
	public List<Localidad> listarLocalidades() throws SQLException {
		ConexionDB conexionDB = new ConexionDB();
		Statement st = conexionDB.crearStatement();

		// ejecuto la consulta sql para traer todas las provincias
		// coloco el resultado de la consulta en rs
		// rs tiene un listado con todas las localidades
		ResultSet rs = st.executeQuery("SELECT * FROM localidades");
		List<Localidad> listLocal = new ArrayList<Localidad>();

		// recorro rs fila por fila
		// creo un obj localidad x cada fila para respetar el POO
		while (rs.next()) {
			 Localidad localidad = new Localidad(rs.getInt("idlocalidad"), rs.getString("nombre"));
			 listLocal.add(localidad);

		}

		return listLocal;
	}
	public Localidad getLocalidadXID(Integer id) throws SQLException {

		ConexionDB conex = new ConexionDB();
		Connection conn= conex.establecerConexion();
		Statement st = conn.createStatement();
		
		
		String sql = new String("SELECT * FROM localidades WHERE idlocalidad = " + id);
		ResultSet rs = st.executeQuery(sql);

		ProvinciaDAOC provinciaDAOC = new ProvinciaDAOC();
		
		while (rs.next()) {
			Provincia provincia = provinciaDAOC.getProvinciaXID(rs.getInt("idProvincia"));
			
			Localidad localidad = new Localidad(rs.getInt("idLocalidad"), rs.getString("nombre"), provincia);
			
			return localidad;
		}		
		
		return null;
	}
	/**
	 * modifica una Localidad de la bbdd
	 * @param idlocalidad
	 * @param nombre
	 * @return true si la modificó o false sino.
	 * @throws SQLException
	 */
	public Boolean updLocalidad(Integer idLoc, String nombre) throws SQLException {
		ConexionDB con = new ConexionDB();
		Statement st= con.crearStatement();
		
		Integer cantUpd = st.executeUpdate("UPDATE localidades SET nombre='"+nombre+"' WHERE idlocalidad='"+idLoc+"'");
		
		return cantUpd == 1;
	}

	/**
	 * 
	 * @param idLoc
	 * @return  true si la borró o false sino.
	 * @throws SQLException
	 */
	public Boolean deleteLocalidad(Integer idLoc) throws SQLException {
		ConexionDB con = new ConexionDB();
		Statement st= con.crearStatement();
		
		Integer cantDel = st.executeUpdate("DELETE FROM localidades WHERE idlocalidad='"+idLoc+"'");
		
		return cantDel == 1;
	}
}
