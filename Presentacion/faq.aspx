<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="faq.aspx.cs" Inherits="Presentacion.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="contenedor-mediano">
        <h2 class="subtitulo">Preguntas frecuentes</h2>
        <div class="descripcion-seccion">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
        </div>
            <div class="faq">
                <div class="faq-izquierda">
                    <div class="preguntas-item">
                        <button type="button" class="pregunta">¿Ahí me asignan el ISBN?</button>
                        <div class="respuesta">
                            <p>NO. El ISBN lo tramita la editorial en la Cámara del Libro, una vez que el original entró en el proceso de edición.</p>
                        </div>    
                    </div> 
                    <div class="preguntas-item">
                        <button class="pregunta">¿Hay que corregir el libro sí o sí?</button>
                        <div class="respuesta">
                            <p>SI. A decir verdad no debería publicarse un libro que no ha sido corregido. En Ediciones Elemento siempre mandamos los originales a corregir… aún de aquellos autores que aseguran no tener ningún error.
                                La corrección libera al original de faltas de ortografía que ningún editor de Word detecta, pule la sintaxis y la ortotipografía.</p>
                        </div>
                    </div> 
                    <div class="preguntas-item">
                        <button class="pregunta">¿Puedo diseñar el libro yo mismo o alguien de mi confianza?</button>
                        <div class="respuesta">
                            <p>SI. El libro puede ser diseñado por el autor o alguien de su confianza, aunque no lo aconsejamos. La mayoría de las veces, el original diseñado por el autor, no se atiene a los parámetros de la industria gráfica.</p>
                        </div>
                    </div>  
                    <div class="preguntas-item">
                        <button class="pregunta">¿Y la tapa?</button>
                        <div class="respuesta">
                            <p>La tapa se trabaja dentro del binomio autor-editor. Entre los dos acordarán qué ilustración o fotografía llevará la portada, qué tipografía… los colores.</p>
                        </div>
                    </div>  
                    <div class="preguntas-item">
                        <button class="pregunta">¿Y si no me gusta el diseño?</button>
                        <div class="respuesta">
                            <p>Tanto el diseño de tapa, como de las páginas interiores deben ser aprobadas por el autor antes de imprimir. El autor verá las galeras y las pruebas color de tapa, dando su conformidad e introduciendo los cambios que considere necesarios.</p>
                        </div>
                    </div>
                    <div class="preguntas-item">
                        <button class="pregunta">¿Qué tipo papel va a tener mi libro?</button>
                        <div class="respuesta">
                            <p>Los datos técnicos de producción se acuerdan a la firma del contrato: gramaje del papel, color, tamaño del libro terminado, papel de tapa, tipo de laminado… El autor tiene la posibilidad de hacer su libro “a medida”, conversando con su editor las posibilidades reales del mercado de acuerdo con el presupuesto acordado.</p>
                        </div>
                    </div>    
                    <div class="preguntas-item">
                        <button class="pregunta">¿Quién se encarga de la presentación del libro?</button>
                        <div class="respuesta">
                            <p>Aquí entra otra vez en acción la dupla autor-editor ¡no existen el uno sin el otro! Ediciones Elemento dispone de algunos lugares -bibliotecas, centros culturales- donde se puede convenir la presentación del libro, o bien pone a disposición del autor, las herramientas necesarias para que la presentación pueda hacerse en otro lugar. </p>
                        </div>
                    </div>    
                    <div class="preguntas-item">
                        <button class="pregunta">¿Y la prensa?</button>     
                        <div class="respuesta">
                            <p>Ediciones Elemento lo asesorará también en este punto… ya sea ayudándolo a contactarse con los medios de su interés –redactando gacetillas o enviando ejemplares solicitados por los medios-, o conectándolo con profesionales que llevarán adelante una campaña de prensa y difusión.</p>
                        </div>
                    </div>  
                    <div class="preguntas-item">
                        <button class="pregunta">¿Tengo un mínimo de ejemplares para editar?</button>
                        <div class="respuesta">
                            <p>Las ediciones llamadas de baja tirada arrancan en los 50 ejemplares. </p>
                        </div>
                    </div>  
                </div>           
                <div class="faq-derecha">
                    <img src="img/faq.jpg" alt="">
                </div>
            </div>
            <h2 class="subtitulo">Ediciones digitales</h2>
            <div class="descripcion-seccion">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
            </div>
            <div class="faq">
                <div class="faq-derecha">
                    <img src="img/faq2.jpg" alt="">
                </div>
                <div class="faq-izquierda">
                    <div class="preguntas-item">
                        <button class="pregunta desplegar">¿Cómo funciona esto?</button>
                        <div class="respuesta">
                           <p>Un eBook, e-book, libro electrónico, ecolibro o libro digital es una versión electrónica o digital de un libro. La comercialización de publicaciones protegidas en formato eBook está diseñada para evitar su copia ilegal.
                            El mismo se crea a partir del diseño original de la obra (con los parámetros y medidas estándar de la industria gráfica), se encripta de manera tal de evadir la piratería y se sube a la web, donde el comercio electrónico hace el resto.
                            </p>
                        </div>
                    </div>   
                    <div class="preguntas-item">
                        <button class="pregunta">Disponibilidad</button>
                        <div class="respuesta">
                            <p>El e-Book, es especial para lectores ansiosos: el usuario simplemente lo compra sin moverse de su casa, lo descarga en segundos y lo lee cuando quiere.</p>
                        </div>
                    </div> 
                    <div class="preguntas-item">
                        <button class="pregunta">Costo</button>
                        <div class="respuesta">
                            <p>El costo de producción de un eBook es menor a la de un libro tradicional y, esta economía se traslada directamente al lector. El ecolibro no usa papel, ni tinta, ni necesita grandes gastos en logística. El lector paga menos y puede darse el gusto de leer más.</p>
                        </div>
                    </div> 
                    <div class="preguntas-item">
                        <button class="pregunta">Ecológico e interactivo</button>
                        <div class="respuesta">
                            <p>Al usar un soporte electrónico, el ecolibro expande las posibilidades del autor, quien puede incluir gráficos multimedia, links a páginas web, buscador de palabras, etc.</p>
                        </div>
                    </div>  
                    <div class="preguntas-item">
                        <button class="pregunta">Dispositivos de lectura</button>
                        <div class="respuesta">
                            <p>Para leer un libro electrónico se necesita: una computadora, o un PDA o cualquier dispositivo que tenga pantalla y memoria. Además, se están incorporando al mercado, distintos lectores de eBook, que permiten leer desenchufado, y a tamaño real. Incluso, algunos de estos aparatos utilizan la tecnología “tinta electrónica” que tiene “efecto papel” gracias a que no tienen iluminación propia y son de muy bajo consumo (¡estos lectores sólo “gastan” energía al pasar la hoja!)</p>
                        </div>
                    </div>  
                    <div class="preguntas-item">
                        <button class="pregunta">Seguridad</button>
                        <div class="respuesta">
                            <p>Es importante tener en cuenta que, es más fácil fotocopiar un libro, que desproteger un e-Book.</p>
                        </div>
                    </div>
                </div>           
            </div>
    </section>
      <script src="js/funciones-acordeon.js"></script>
</asp:Content>
