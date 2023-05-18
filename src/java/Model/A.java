/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author this pc
 */
public class A {
    public static void main(String[] args) {
        String a="image";
        String image="";
        
        for (int i = 0; i < 5; i++) {
            if(image.isEmpty()){
                image=a+"#";
            }else{
                image=image+a+"#";
            }
        }
        
        System.out.println(image);
    }
}
