package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dataBase.ConexionDB;
import model.Usuario;

public class UsuarioDAO2 {
	/**
	 * Valida que el user y pass existan en la tabla Usuarios de la bbdd.
	 * 
	 * @param user
	 * @param pass
	 * @return Si existe devuelve true sino false;
	 * @throws SQLException
	 */
	public Boolean validarUsuYPass(String user, String pass) throws SQLException {

		ConexionDB conexionDB = new ConexionDB();
		Statement st = conexionDB.crearStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM usuarios WHERE usuario='" + user + "' AND clave='" + pass + "'");
		return rs.next();

	}
	public Boolean guardarUsuario(Usuario usuario) {
		try {
			ConexionDB conexionDB = new ConexionDB();
			Connection connection = conexionDB.establecerConexion();
			Statement statement = connection.createStatement();
			
			String sql = new String();
			sql = "INSERT INTO `usuarios`(`usuario`, `clave`) VALUES ( "
					+ "'"+ usuario.getUsuario() + "'," 
					+ "'" + usuario.getClave() + "');";
			
			statement.executeUpdate(sql);
			
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	/**
	 * Busca todos los usuarios de la tabla Usuarios de la DB.
	 * 
	 * @return Devuelve una lista de Objetos {@link Usuario}
	 * @throws SQLException
	 */
	public List<Usuario> listarUsuarios() throws SQLException {
		ConexionDB conexionDB = new ConexionDB();
		Statement st = conexionDB.crearStatement();

		// ejecuto la consulta sql para traer todos los usuarios
		// coloco el resultado de la consulta en rs
		// rs tiene un listado con todos los usuarios
		ResultSet rs = st.executeQuery("SELECT * FROM usuarios");
		List<Usuario> listUsu = new ArrayList<Usuario>();

		// recorro rs fila por fila
		// creo un obj Usuario x cada fila para respetar el POO
		while (rs.next()) {
			Usuario usu = new Usuario(rs.getInt("idusuario"), rs.getString("usuario"), rs.getString("clave"));

			listUsu.add(usu);
		}

		return listUsu;
	}

	public Boolean updUsuario(Integer idusuario, String usuario, String clave) throws SQLException {

		ConexionDB con = new ConexionDB();
		Statement st = con.crearStatement();

		Integer cantUpd = st.executeUpdate("UPDATE usuarios SET usuario='" + usuario + "', clave='" + clave
				+ "' WHERE idusuario='" + idusuario + "'");

		return cantUpd == 1;
	}
	/**
	 * 
	 * @param idUsuario
	 * @return  true si la borró o false sino.
	 * @throws SQLException
	 */
	public Boolean deleteUsuario(Integer idUsuario) throws SQLException {
		ConexionDB con = new ConexionDB();
		Statement st= con.crearStatement();
		
		Integer cantDel = st.executeUpdate("DELETE FROM usuarios WHERE idusuario='"+idUsuario+"'");
		
		return cantDel == 1;
	}

}
