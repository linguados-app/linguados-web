<%@ page contentType="text/html;charset=UTF-8" %>

 <html>

 <head>

     <title>Criar Desafio</title>

     <style>

         body{
             font-family: Arial;
             padding:40px;
             background:#f5f5f5;
         }

         .box{
             background:white;
             padding:30px;
             border-radius:12px;
             max-width:700px;
             margin:auto;
         }

         input,
         textarea,
         select{
             width:100%;
             padding:12px;
             margin-top:10px;
             margin-bottom:20px;
         }

         button{
             padding:12px 20px;
             border:none;
             background:#4f46e5;
             color:white;
             border-radius:8px;
             cursor:pointer;
         }

         .extra{
             display:none;
         }

     </style>

 </head>

 <body>

 <div class="box">

     <h1>Novo Desafio</h1>

     <form method="post"
           action="${pageContext.request.contextPath}/admin/desafio/criar">

         <input type="hidden"
                name="idModulo"
                value="<%= request.getAttribute("idModulo") %>">

         <!-- TITULO -->

         <label>Título</label>

         <input type="text"
                name="titulo"
                required>

         <!-- ENUNCIADO -->

         <label>Enunciado</label>

         <textarea name="enunciado"
                   required></textarea>

         <!-- TIPO -->

         <label>Tipo</label>

         <select name="tipo"
                 id="tipo"
                 onchange="trocarCampos()">

             <option value="TRADUCAO">
                 Tradução
             </option>

             <option value="LACUNA">
                 Lacuna
             </option>

             <option value="MULTIPLA_ESCOLHA">
                 Múltipla Escolha
             </option>

         </select>

         <!-- DIFICULDADE -->

         <label>Dificuldade</label>

         <select name="dificuldade">

             <option value="Facil">Fácil</option>
             <option value="Medio">Médio</option>
             <option value="Dificil">Difícil</option>

         </select>

         <!-- XP -->

         <label>XP</label>

         <input type="number"
                name="xp"
                required>

         <!-- RESPOSTA -->

         <label>Resposta Correta</label>

         <input type="text"
                name="resposta"
                required>

         <!-- ================================= -->
         <!-- CAMPOS LACUNA -->
         <!-- ================================= -->

         <div id="lacunaCampos"
              class="extra">

             <h3>Lacuna</h3>

             <label>Texto Antes</label>

             <input type="text"
                    name="textoAntes">

             <label>Texto Depois</label>

             <input type="text"
                    name="textoDepois">

             <label>Palavra Omitida</label>

             <input type="text"
                    name="palavraOmitida">

         </div>

         <!-- ================================= -->
         <!-- CAMPOS MULTIPLA -->
         <!-- ================================= -->

         <div id="multiplaCampos"
              class="extra">

             <h3>Múltipla Escolha</h3>

             <label>Alternativa A</label>
             <input type="text" name="altA">

             <label>Alternativa B</label>
             <input type="text" name="altB">

             <label>Alternativa C</label>
             <input type="text" name="altC">

             <label>Alternativa D</label>
             <input type="text" name="altD">

         </div>

         <button type="submit">

             Salvar Desafio

         </button>

     </form>

 </div>

 <script>

     function trocarCampos(){

         let tipo =
             document.getElementById("tipo").value;

         document.getElementById("lacunaCampos")
             .style.display = "none";

         document.getElementById("multiplaCampos")
             .style.display = "none";

         if(tipo === "LACUNA"){

             document.getElementById("lacunaCampos")
                 .style.display = "block";
         }

         if(tipo === "MULTIPLA_ESCOLHA"){

             document.getElementById("multiplaCampos")
                 .style.display = "block";
         }
     }

     trocarCampos();

 </script>

 </body>

 </html>