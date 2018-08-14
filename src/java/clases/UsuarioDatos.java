/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jbalceda
 */
public class UsuarioDatos {

    Connection c;
    PreparedStatement insertar, consultar;

    public UsuarioDatos() throws Exception{
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
        c=DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE","hr","hr");
        insertar=c.prepareStatement("INSERT INTO usuarios(nombre, email) VALUES (?, ?)");
        consultar=c.prepareStatement("SELECT * FROM usuarios");
    }
    
    public void registrarUsuario(Usuario usr) throws Exception{
        insertar.setString(1, usr.getNombre());
        insertar.setString(2, usr.getEmail());
        insertar.executeUpdate();
    }
    
    public List<Usuario> consultarUsuarios() throws Exception{
        List<Usuario> lista = new ArrayList<>();
        ResultSet rs = consultar.executeQuery();
        
        while (rs.next()) {
            Usuario u = new Usuario();
            u.setNombre(rs.getString(1));
            u.setEmail(rs.getString(2));
            lista.add(u);
        }
        return lista;
    }
}
