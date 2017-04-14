/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.analisadorlexico.parte2;

import java.io.IOException;
import java.io.StringReader;


public class Test {
public static void main(String[] args) throws IOException {
        
        String expr = "if 4 + 5 + 'aa 5 + a' ___aaa != == <= {>=} then for 2 - 3,2";

        AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(expr));
        lexical.yylex();

    }
  
}