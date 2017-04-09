/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.analisadorlexico.parte2;

import java.io.File;
import java.nio.file.Paths;

public class Gerador {

    public static void main(String[] args) {

        String rootPath = Paths.get("").toAbsolutePath(). toString();
        String subPath = "/src/br/com/analisadorlexico/parte2/";
        String file = rootPath + subPath + "gramatica.lex";

        File sourceCode = new File(file);

        jflex.Main.generate(sourceCode);

    }
}
