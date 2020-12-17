/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package danhnlc.Interface;

import danhnlc.dtos.Armor;
import java.rmi.Remote;
import java.util.List;

/**
 *
 * @author User
 */
public interface ArmorInterface extends Remote{
     
    boolean createArmor(Armor dto) throws Exception;
    Armor findByArmorID(String id) throws Exception;
    List<Armor> findAllArmor() throws Exception;
    boolean removeArmor(String id) throws Exception;
    boolean updateArmor(Armor dto) throws Exception;
    boolean checkLogin(String username, String password) throws Exception;
}
