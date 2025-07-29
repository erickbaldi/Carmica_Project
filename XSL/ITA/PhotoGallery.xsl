<?xml version="1.0" ?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<xsl:output method="html" indent="no"/>

<html>
<head>
<title>Photo Gallery</title>      
<meta name="author" content="Erick Baldi e Riccardo Fiocchi"/>
<link href="stile.css" rel="stylesheet" type="text/css"/>

<script language="javascript">
<![CDATA[
  
var message = new Array();
message[0]=" Benvenuto nella photo gallery! ";
message[1]=" Qui ci sono le foto piu' rappresentative ";
message[2]=" scelte da noi!! ";
message[3]=" Dai un'occhiata e leggi la nostra storia! ";
message[4]="";

var reps=1;
var speed=120; //large number=lower action
var hold=10;
var p=message.length;
var q=0; var r=0; var C=0; var mC=0; var s=0; var sT=null;

if(reps<1){reps=1;}

function setMessage(){
    typing = message[mC];
    q=typing.length;
    r=q+hold;
    typeMessage();
}

function typeMessage(){
    if(s>r){s=0;}
    if(s>q){
        document.title = '|- ' +typing+ '- - -';
    } else {
        document.title = '|- ' +typing.substr(0,s)+ '- - -';
    }
    if(C<(r*reps)){
        sT=setTimeout("typeMessage()",speed);
        C++;
        s++;
    } else{
        C=0;
        s=0;
        mC++;
        if(mC > (p-1)){mC=0;}
        sT=null;
        setMessage();
}
}

setMessage();

function view() 
                {
                 document.updateform.cmd.value="view";
                 document.updateform.submit();
                }
]]>
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" >

<form name="updateform"  method="POST" action="Basket.jsp">
     <input type="hidden" name="cmd"    />
</form>

<form name="formx" action="Basket.jsp" method="POST">
   <input type="hidden" name="nomeprodotto" value="0" />
</form>  


<div class="T2">
     <a href="home.jsp"><img src="images/ENG/home.gif" /></a>
     <br/>
     <input type="button" value="Back" onClick="javascript:history.back()" class="stile"/>
     <br/><br/><br/>
     <img src="images/ENG/chit1.gif" /><br/>
     <a href="Catalogo.jsp"><span class="stile">Scopri il nostro catalogo</span></a>
     <br/>     
<br/><br/>
<img src="images/ENG/cd5.GIF" /> 
<br/>
<a href="CreaCD.jsp"><span class="stile">Crea il tuo CD!</span></a> 
<br/><br/><br/>
<img src="images/ENG/dvd_player.gif" /> 
<br/>
<a href="CreaDVD.jsp"><span class="stile">Crea il tuo DVD!</span></a> 
<br/><br/><br/>
<img src="images/ENG/java.GIF" />
<br/>
<a href="CreaMaglietta.jsp"><span class="stile">Crea la tua maglietta!</span></a>  
<br/><br/><br/>
<img src="images/ENG/carrello.jpg" width="120" height="110" /> 
<br/>
<a href="javascript:view()"><span class="stile">Vai al carrello</span></a>
                 
</div>
 
 
<div class= "T8"> 
<span class="fire2" align="center">PHOTO GALLERY &amp; STORYBOARD</span><br/><br/>      
<span class="stile">
Benvenuto/a nella photogallery! Guarda le foto scattate ai concerti!! Puoi anche
conoscere la storia dei Carmica..
Abbiamo inoltre inserito il nostro rider tecnico per ulteriori informazioni
sugli strumenti che usiamo. E' utile per chi, nel caso di concerti, e' addetto
alla strumentazione audio...I Carmica ringraziano!
</span><br/><br/><hr/>
<span class="stilerosso">
<br/>
Clicca su una delle foto e guardala in dimensioni originali
<br/>
<table>
<tr><td>
<a href="javascript:window.open('images/photogallery/carmica1.JPG', target='_self')"><img border="1" src="images/photogallery/carmica1_small.JPG" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/carmica2.JPG',target='_self')"><img border="1" src="images/ENG/carmica2_small.JPG" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/dm.jpg',target='_self')" ><img border="1" src="images/photogallery/dm.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/dm2.jpg',target='_self')" ><img border="1" src="images/photogallery/dm2.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/gruppo.JPG',target='_self')" ><img border="1" src="images/photogallery/gruppo.JPG" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/grosso.jpg',target='_self')" ><img border="1" src="images/photogallery/grosso.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/pea.jpg',target='_self')" ><img border="1" src="images/photogallery/pea.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/manno.jpg',target='_self')" ><img border="1" src="images/photogallery/manno.jpg" width="125" height="90"/></a></td>
</tr>
<tr><td>
<a href="javascript:window.open('images/photogallery/mek.jpg',target='_self')" ><img border="1" src="images/photogallery/mek.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/milo.jpg',target='_self')" ><img border="1" src="images/photogallery/milo.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/grosso2.jpg',target='_self')" ><img border="1" src="images/photogallery/grosso2.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/marco.jpg',target='_self')" ><img border="1" src="images/photogallery/marco.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/beppe.jpg',target='_self')" ><img border="1" src="images/photogallery/beppe.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/milo3.jpg',target='_self')" ><img border="1" src="images/photogallery/milo3.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/marco2.jpg',target='_self')" ><img border="1" src="images/photogallery/marco2.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/BD_007.jpg',target='_self')" ><img border="1" src="images/photogallery/BD_007.jpg" width="125" height="90"/></a></td>
</tr>
<tr><td>
<a href="javascript:window.open('images/photogallery/BD_030.jpg',target='_self')" ><img border="1" src="images/photogallery/BD_030.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/BD_031.jpg',target='_self')" ><img border="1" src="images/photogallery/BD_031.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/BD_034.jpg',target='_self')" ><img border="1" src="images/photogallery/BD_034.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/BD_035.jpg',target='_self')" ><img border="1" src="images/photogallery/BD_035.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/BD_040.jpg',target='_self')" ><img border="1" src="images/photogallery/BD_040.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/BD_041.jpg',target='_self')" ><img border="1" src="images/photogallery/BD_041.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/BD_044.jpg',target='_self')" ><img border="1" src="images/photogallery/BD_044.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/BD_045.jpg',target='_self')" ><img border="1" src="images/photogallery/BD_045.jpg" width="125" height="90"/></a></td>
</tr>
<tr><td>
<a href="javascript:window.open('images/photogallery/cencios.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/cencios_10.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_10.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/cencios_13.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_13.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/cencios_14.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_14.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/cencios_15.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_15.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/cencios_17.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_17.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/cencios_18.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_18.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/cencios_22.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_22.jpg" width="125" height="90"/></a></td>
</tr>
<tr><td>
<a href="javascript:window.open('images/photogallery/cencios_33.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_33.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/cencios_35.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_35.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/cencios_6.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_6.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/cencios_8.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_8.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/cencios_9.jpg',target='_self')" ><img border="1" src="images/photogallery/cencios_9.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/charlyg.jpg',target='_self')" ><img border="1" src="images/photogallery/charlyg.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/charlyf.jpg',target='_self')" ><img border="1" src="images/photogallery/charlyf.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/charlyb.jpg',target='_self')" ><img border="1" src="images/photogallery/charlyb.jpg" width="125" height="90"/></a></td>
</tr>
<tr><td>
<a href="javascript:window.open('images/photogallery/giostra2.jpg',target='_self')" ><img border="1" src="images/photogallery/giostra2.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/giostra4.jpg',target='_self')" ><img border="1" src="images/photogallery/giostra4.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/giostra8.jpg',target='_self')" ><img border="1" src="images/photogallery/giostra8.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/giostra9.jpg',target='_self')" ><img border="1" src="images/photogallery/giostra9.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/giostra.jpg',target='_self')" ><img border="1" src="images/photogallery/giostra.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/GROSSO10.JPG',target='_self')" ><img border="1" src="images/photogallery/GROSSO10.JPG" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/GROSSO20.JPG',target='_self')" ><img border="1" src="images/photogallery/GROSSO20.JPG" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/FRED.JPG',target='_self')" ><img border="1" src="images/photogallery/FRED.JPG" width="125" height="90"/></a></td>
</tr>
<tr><td>
<a href="javascript:window.open('images/photogallery/vs.jpg',target='_self')" ><img border="1" src="images/photogallery/vs.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/vs5.jpg',target='_self')" ><img border="1" src="images/photogallery/vs5.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/vs6.jpg',target='_self')" ><img border="1" src="images/photogallery/vs6.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/vs14.jpg',target='_self')" ><img border="1" src="images/photogallery/vs14.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/vs23.jpg',target='_self')" ><img border="1" src="images/photogallery/vs23.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/vs24.jpg',target='_self')" ><img border="1" src="images/photogallery/vs24.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/vs31.jpg',target='_self')" ><img border="1" src="images/photogallery/vs30.jpg" width="125" height="90"/></a></td>
<td>
<a href="javascript:window.open('images/photogallery/vs29.jpg',target='_self')" ><img border="1" src="images/photogallery/vs29.jpg" width="125" height="90"/></a></td>
</tr>

</table>
</span>
<br/><br/><hr/>

<span class="stileblu" >
<br/>
BACKLINE TECNICA</span>
<dl>
<dt><strong>BATTERIA</strong></dt> <dd>1CASSA,1 TOM,CHARLESTON,1RULLANTE,1TIMPANO,1PEDALE,2CRASH,1RIDE</dd>
<dt><strong>CHITARRA 1</strong></dt> <dd>AMPLIFICATORE FENDER ROCK PRO 700</dd>
<dt><strong>CHITARRA 2</strong></dt> <dd>AMPLIFICATORE LANEY TFX3</dd>
<dt><strong>BASSO</strong></dt> <dd>AMPLIFICATORE BEHRINGER, TESTATA ULTRABASS BX300T,CONO BA 210,W500</dd>
<dt><strong>VOCE</strong></dt> <dd>MICROFONO SHURE SM 58</dd>
<dt><strong>TASTIERA</strong></dt> <dd>YAMAHA PORTABLE GRAND DGX-305</dd>
</dl>

<br /><br /><hr/>
<span class="elementiTabella" >
<br/>
<span class="stileblu" align="center">LA STORIA DEI CARMICA</span><br/><br/>
I Carmica nascono nel 1999 con il nome di Doppio Malto a Castiglione dei Pepoli, piccolo paesino della provincia bolognese, dalle menti di 4 ragazzi: Maurizio Elmi (voce), Marco Bettazzi (chitarra), Mattia Beccaglia (basso), Christian Giannerini (batteria). Lo scopo del gruppo e' di imparare a suonare e divertirsi ed il genere prediletto e' il rock, cosi la band inizia studiando pezzi di vari gruppi: Beatles, Doors, Red Hot Chili Peppers, Green Day, U2 ecc.., e si esibisce in varie serate nei paesi dell'Appennino Tosco-Emiliano partecipando inoltre alla rassegna musicale dei Giardini Margherita a Bologna.
Nel 2001 entra nel gruppo alla voce, al posto di Maurizio, Milo Giovanelli e inizia a nascere l'esigenza di provare a comporre qualcosa di proprio, ma per fare una cosa simile si deve avere chiaro il genere musicale e l'impronta che si vuole dare al gruppo, cosi' i DM decidono di sperimentare diversi generi musicali per arrivare alla fine alla musicalita' piu' adatta alla band. Si studiano i pezzi blues (B.B.King), rock (Jimi Hendrix), crossover (Rage Against The Machine), punk (Ramones, Clash, Punkreas), hard rock (Black Sabbath) e rock alternativo italiano (Afterhours). Logicamente in quel momento si 
impone anche uno studio piu' approfondito degli strumenti musicali e della voce quindi i ragazzi decidono di prendere seriamente lezioni e di applicarsi al massimo per raggiungere il loro scopo.
Nell'estate del 2003 i Doppio Malto compongono il loro primo brano: "Giuda di carta" che decidono di portare assieme alla cover "Give it away" dei RHCP al concorso per band emergenti FESTIVAL DELLE ARTI, organizzato da Andrea Mingardi alla Tenda Estragon di Bologna. Nel frattempo il gruppo sta ultimando un altro progetto, creare un festival musicale che abbia lo scopo unico di dare visibilita' a tutti quei ragazzi che hanno la passione della musica; cosi', il 27,28 e 29 Luglio 2003 alla piscina di Castiglione dei Pepoli con il patrocinio del Comune e l'aiuto dei volontari della Croce Rossa si svolge la 
prima edizione del BLACK DOG ROCK FESTIVAL, alla quale partecipano molti gruppi provenienti da province vicine e lontane: DOPPIO MALTO, SINETEMPORE, HINKI GREASY STUFF, 
FEKES OF FIELDS (Castiglione), OUTLINE (Lagaro), SOLO IN CASA, MISTER BLOB, CAMMELLI BELGI (Prato), MALAFEDE (Baragazza), THE BOOGERS (San Giovanni in Persiceto)
Nell'inverno del 2003 Marco, chitarra, parte per Parigi dove rimarra' per 9 mesi; nel gruppo subentrano altre 2 chitarre: Leonardo Raffreddato e Marco Brentazzoli, e nella formazione da 5 i DM portano a termire il loro brano ufficiale : OKINAWA, incentrato sulla storia di alcune ragazze giapponesi incinte che decisero, alla fine della Seconda Guerra Mondiale, di suicidarsi gettandosi dalle scogliere della loro isola, Okinawa, allo sbarco dell'esercito americano.
Il pezzo viene presentato al pubblico nell'estate dello stesso anno, durante la seconda edizione del BLACK DOG ed il riscontro e' anche migliore delle aspettative, anche perche il festival cresce di anno in anno ed inizia a diventare un evento importante per le musica dell'Appennino. A questa edizione partecipano: DOPPIO MALTO, CROSS CURRENT, SINETEMPORE, OLD CHILDREN (Castiglione), GIANNI SARCHI, KILL THE NICE GUY, MISTER BANANA AND THE BLOBBERS (Prato), MALAFEDE (Baragazza) e ROBERTO RUBINETTI (Lagaro).
Nel frattempo Marco torna dalla Francia e Leonardo deve lasciare il gruppo per motivi di lavoro; il demo di OKINAWA, che contiene il brano e una versione riarrangiata di FOXY LADY, viene consegnato allo stand di ROCKIT durante il M.E.I. di Faenza, che pubblichera' nel mese di Gennaio 2004 una recensione favorevole alle scelte che i ragazzi hanno apportato al loro cammino musicale.
Nel 2005 grazie al supporto di Vivamusic e Discografici.net il singolo OKINAWA viene trasmesso in circa 500 radio tra locali e nazionali, tra cui anche RADIO MONTECARLO,viene inserito nel cd TOP PREMIERE e presentato durante il M.E.I. di Faenza.
Essendo il nome Doppio Malto nato come cover band non rispecchia piu' la strada che viene percorsa, cosi' nel 2006 il gruppo cambia nome in CARMICA.
Nel Febbraio 2006 Milo (voce) suona il Theremin all'interno dell'incisione dell'EP dei SOLO IN CASA, gruppo che ha la produzione artistica di Paolo Benvegnu.
Ora, i CARMICA si definiscono gruppo rock, perche e' una parola che significa tutto e niente, vista la varieta' di generi che comprende; chiudersi e lasciarsi catalogare e' anche un modo per chiudere la mente e la liberta' espressiva. 
Quindi lasciano a chi li ascolta, se vogliono, le considerazioni su genere preciso e strada definita, ma piu' che altro sperano che la gente ascolti e comprenda la loro musica e i messaggi contenuti in essa, cioe' che in questi anni la cosa di cui ha piu' paura la gente e' il proprio riflesso.

</span>

</div>
</body>
</html>

</xsl:template>
</xsl:stylesheet>