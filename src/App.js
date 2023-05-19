
import './App.css';
import HomePage from './components/homepage';
import { Component } from 'react';
import Navbar from './components/navbar';
import Accesso from './components/accesso';
import Registrazione from './components/registrazione';
import Prodotto from './components/prodotto';
import Serie from './components/serie';
import Carrello from './components/carrello';
import Account from './components/account';
import Ordini from './components/ordini';
import DatiPersonali from './components/datipersonali';
import Indirizzi from './components/indirizzi';
import VisualizzaOrdine from './components/visualizzaordine';
import AddRecapito from './components/addrecapito';
import Checkout from './components/checkout';

import Control from './components/control';
import Search from './components/serach';

import demon from './images/demon-slayer-1.jpg'
 

class App extends Component {
  pagina = {"url" : "home"};

  utente = {"Id_Utente": -1, "nome": "guest", "cognome": "v", "email" : "guest@gmail.com", "password": "ciao123", "ruolo": "user"};
  alertaccesso = {"vispasswd": "hidden", "visemail": "hidden","visnome":"hidden","viscognome":"hidden"};
  prodotto = {Id_Prodotto: 1, Id_Serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantità: 20,
  datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon,prezzo: "5.10"};
  serie = {Id_Serie: 100,nome : "Demon Slayer", volumitotali : 23, stato : "completa"};
  ordineacquisto = {Id_Acquisto : 1};
  admin = 0;
  passwordUtente = "";
  Id_Recapito_Effettivo = -1;
  
  handleGoToHome = btn =>{
    var url = "home";
    this.pagina.url = url;
    const pagina = this.pagina.url;
    this.setState({pagina});
  }

  handleGoToCarrello = btn =>{
    var url = "carrello";
    this.pagina.url = url;
    const pagina = this.pagina.url;
    this.setState({pagina});
  }

  handleGoToVisualizzaOrdine = ordine =>{
    this.ordineacquisto.Id_Acquisto = ordine.Id_Acquisto;
    const ordineacquisto = this.ordineacquisto;
    var url = "visualizzaordine";
    this.pagina.url = url;
    const pagina = this.pagina.url;
    this.setState({pagina});
    this.setState({ordineacquisto});

  }

  handleGoToDatipersonali = btn =>{
    var url = "datipersonali";
    this.pagina.url = url;
    const pagina = this.pagina.url;
    this.setState({pagina});
  }

  handleGoToOrdini = btn =>{
    if(btn === 1){
      this.admin = 1;
    }
    else{
      this.admin = 0;
    }
    const admin = this.admin;
    var url = "ordini";
    this.pagina.url = url;
    const pagina = this.pagina.url;
    this.setState({admin});
    this.setState({pagina});
  
  }

  handleGoToindirizzi = btn =>{
    var url = "indirizzi";
    this.pagina.url = url;
    const pagina = this.pagina.url;
    this.setState({pagina});
  }

  handleGoToAccount = btn =>{

    this.alertaccesso.visemail = "hidden";
    this.alertaccesso.vispasswd = "hidden";
    const alertaccesso = this.alertaccesso;
    this.setState({alertaccesso});
    var url;
    if(this.utente.Id_Utente === -1){
      url = "accesso";
    }
    else {
      url = "account";
    }
    this.pagina.url = url;
    const pagina = this.pagina.url;
    this.setState({pagina});
  }

  handleAddCarrello = prodotto => {
    if(prodotto.stato !== "disponibile" || this.utente.Id_Utente === -1){
      return;
    }
    var aggiungialCarrello = {"Id_Utente": this.utente.Id_Utente, "Id_Prodotto": prodotto.Id_Prodotto,"sign": "null"};
    fetch('http://127.0.0.1:5555/aggiungialCarrello', {
      method: 'POST',
      body: JSON.stringify(aggiungialCarrello),
      headers: {
          'Content-type': 'application/json; charset=UTF-8',
      },
    })
    .catch((err) => {
        console.log(err.message);
    });
  }

  handleGoToProdotto = prodotto1 => {
    this.prodotto = prodotto1;
    const prodotto = this.prodotto;
    var url = "prodotto";
    this.pagina.url = url;
    const pagina = this.pagina.url;
    this.setState({pagina});
    this.setState({prodotto});

    var getserie = {"Id_Serie": prodotto1.Id_Serie};
    fetch('http://127.0.0.1:5555/getSerie', {
      method: 'POST',
      body: JSON.stringify(getserie),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      })
      .then(res => res.json())
      .then((data) => {
        this.serie = data[0];
        const serie = this.serie;
        this.setState({serie});
      })
      .catch((err) => {
        console.log(err.message);
      });
  }

  handleGoToSerie = btn => {
    var url = "serie";
    this.pagina.url = url;
    const pagina = this.pagina.url;
    this.setState({pagina});
  }

  handleGoToRegistrazione = btn =>{
    this.alertaccesso.visemail = "hidden";
    this.alertaccesso.vispasswd = "hidden";
    this.alertaccesso.visnome = "hidden";
    this.alertaccesso.viscognome = "hidden";
    const alertaccesso = this.alertaccesso;
    this.setState({alertaccesso});
    var url = "registrazione";
    this.pagina.url = url;
    const pagina = this.pagina.url;
    this.setState({pagina});
  }

  handleAccesso = (email,passwd) => {
    var stop = Control(email,passwd,"","",1);
    if(stop.email === "true") {
      this.alertaccesso.visemail = "visible";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }
    else{
      this.alertaccesso.visemail = "hidden";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }
    if(stop.passwd === "true") {
      this.alertaccesso.vispasswd = "visible";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }
    else{
      this.alertaccesso.vispasswd = "hidden";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }

    //Connessione al Database per effettuare l'accesso
    if(stop.email !== "true" && stop.passwd !== "true"){
      var accedi ={opzione: "accedi", "email" : email, "passwd" : passwd};

      fetch('http://127.0.0.1:5555/verificaUtente', {
      method: 'POST',
      body: JSON.stringify(accedi),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      })
      .then(res => res.json())
      .then((data) => {
        if(data[0].Id_Utente === "-1"){
          alert("Email o password sono sbagliati..");
        }
        else{
          this.utente = data[0];
          const utente = this.utente;
          this.setState({utente});
          this.passwordUtente = passwd;
          const passwordUtente = this.passwordUtente;
          this.setState({passwordUtente});
          this.handleGoToHome();
        }
        //alert(data[0].Id_Utente);
      })
      .catch((err) => {
        console.log(err.message);
      });
      //alert("connessione_utente");
    }

  }

  handleRegister = (nome,cognome,email,passwd) => {
    var stop = Control(email,passwd,nome,cognome,2);
    if(stop.email === "true") {
      this.alertaccesso.visemail = "visible";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }
    else{
      this.alertaccesso.visemail = "hidden";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }
    if(stop.passwd === "true") {
      this.alertaccesso.vispasswd = "visible";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }
    else{
      this.alertaccesso.vispasswd = "hidden";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }
    if(stop.nome === "true") {
      this.alertaccesso.visnome = "visible";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }
    else{
      this.alertaccesso.visnome = "hidden";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }
    if(stop.cognome === "true") {
      this.alertaccesso.viscognome = "visible";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }
    else{
      this.alertaccesso.viscognome = "hidden";
      const alertaccesso = this.alertaccesso;
      this.setState({alertaccesso});
    }

    //Connessione al Database per effettuare la registrazione
    if(stop.email !== "true" && stop.passwd !== "true" && stop.nome !== "true" && stop.cognome !== "true" ){
      //alert("Registrazione_utente");

      var registrazione = {opzione : "registrati","email" : email,"passwd": passwd, "nome": nome, "cognome": cognome};
      fetch('http://127.0.0.1:5555/verificaUtente', {
        method: 'POST',
        body: JSON.stringify(registrazione),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      })
      .then(res => res.json())
      .then((data) => {
        if(data[0].Id_Utente === "-1"){
          alert("Utente già registrato");
          //Utente già registrato
        }
        else{
          this.utente = data[0];
          const utente = this.utente;
          this.setState({utente});
          this.passwordUtente = passwd;
          const passwordUtente = this.passwordUtente;
          this.setState({passwordUtente});
          this.handleGoToHome();
        }
       
      })
      .catch((err) => {
        console.log(err.message);
      });
    }

  }

  handleGoToAddRecapito = btn => {
    if(btn !== 3) {
      var url = "addrecapito";
      this.pagina.url = url;
      const pagina = this.pagina.url;
      this.setState({pagina});
    }
   
  }

  handleGoToCheckout = btn =>{
      var url = "checkout";
      this.pagina.url = url;
      const pagina = this.pagina.url;
      this.setState({pagina});
  }

  handleSearch = testo => {
    var str = Search(testo);
    //var output = str.nome + " " +str.nvol;
    if(str.nome === "-1"){
      return;
    }
    fetch('http://127.0.0.1:5555/searchProdotto', {
      method: 'POST',
      body: JSON.stringify(str),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      })
      .then(res => res.json())
      .then((data) => {
        if(data[0].Id_Prodotto === "-1"){
          return;
        }
        this.handleGoToProdotto(data[0]);
      })
      .catch((err) => {
        console.log(err.message);
      });
  }

  handleRecapitoEffettivo = rec =>{
    this.Id_Recapito_Effettivo = rec.Id_Recapito;
    const Id_Recapito_Effettivo =  this.Id_Recapito_Effettivo;
    this.setState({Id_Recapito_Effettivo});
  }

  handleLogOut = btn => {
    this.utente.Id_Utente = -1;
    this.utente.ruolo = "user";
    const utente = this.utente;
    this.setState({utente});
	this.handleGoToHome();
  }
 
  render(){

    let navbar = <>
                    <Navbar 
                    OnGoToCarrello={this.handleGoToCarrello}
                    OnGoToHome={this.handleGoToHome}
                    OnGoToAccount={this.handleGoToAccount}
                    OnSearch={this.handleSearch}
                    OnGoToOrdini={this.handleGoToOrdini}
                    OnLogOut={this.handleLogOut}
                    ruolo={this.utente.ruolo}
                    Id_Utente={this.utente.Id_Utente}/>
                 </>;

    switch(this.pagina.url){
      case "home": {
        return (
          <>
            {navbar}
            <HomePage 
            OnCarrello={this.handleAddCarrello}
            OnGoToProdotto={this.handleGoToProdotto}
            utente={this.utente}/>
          </>
        );
      }
      case "carrello": {
        return (
          <>
            {navbar}
            <h3>Carrello</h3>
            <Carrello 
            utente={this.utente}
            OnGoToCheckout={this.handleGoToCheckout}/>
          </>
        );
      }
      case "account": {
        return (
          <>
            {navbar}
            <h3>Account</h3>
            <Account 
            OnGoToIndirizzi={this.handleGoToindirizzi}
            OnGoToDatipersonali={this.handleGoToDatipersonali}
            OnGoToOrdini={this.handleGoToOrdini}/>
          </>
        );
      }
      case "datipersonali": {
        return (
          <>
            {navbar}
            <h3>datipersonali</h3>
            <DatiPersonali 
            utente={this.utente}
            passwordUtente={this.passwordUtente}/>
          </>
        );
      }
      case "ordini": {
        return (
          <>
            {navbar}
            <h3>ordini</h3>
            <Ordini 
            OnGoToVisualizzaOrdine={this.handleGoToVisualizzaOrdine}
            admin={this.admin}
            utente={this.utente}/>
          </>
        );
      }
      case "visualizzaordine": {
        return (
          <>
            {navbar}
            <h3>visualizzaordine</h3>
            <VisualizzaOrdine 
            ordineacquisto={this.ordineacquisto}
            admin={this.admin}
            OnGoToOrdini={this.handleGoToOrdini}/>
          </>
        );
      }
      case "indirizzi": {
        return (
          <>
            {navbar}
            <h3>indirizzi</h3>
            <Indirizzi 
            utente={this.utente}
            OnGoToAddRecapito={this.handleGoToAddRecapito}/>
          </>
        );
      }
      case "addrecapito": {
        return (
          <>
            {navbar}
            <h3>addrecapito</h3>
            <AddRecapito 
            utente={this.utente}
            OnGoToIndirizzi={this.handleGoToindirizzi}/>
          </>
        );
      }
      case "accesso": {
        return (
          <>
            {navbar}
            <h3>accesso</h3>
            <Accesso 
            alertaccesso={this.alertaccesso}
            OnAccesso={this.handleAccesso}
            OnRegistrazione={this.handleGoToRegistrazione}/>
          </>
        );
      }
      case "registrazione": {
        return (
          <>
            {navbar}
            <h3>registrazione</h3>
            <Registrazione 
            alertaccesso={this.alertaccesso}
            OnRegister={this.handleRegister}
            OnGoToAccesso={this.handleGoToAccount}/>
          </>
        );
      }
      case "prodotto": {
        return (
          <>
            {navbar}
            <h3>prodotto</h3>
            <Prodotto 
            prodotto={this.prodotto}
            serie={this.serie}
            OnGoToSerie={this.handleGoToSerie}
            OnCarrello={this.handleAddCarrello}/>
          </> 
        );
      }
      case "serie": {
        return (
          <>
            {navbar}
            <h3>serie</h3>
            <Serie 
            serie={this.serie}
            OnCarrello={this.handleAddCarrello}
            OnGoToSerie={this.handleGoToSerie}/>
          </>
        );
      }
      case "checkout": {
        //alert(this.Id_Recapito_Effettivo);
        return (
          <>
            {navbar}
            <h3>checkout</h3>
            <Checkout 
            OnRecapitoEffettivo={this.handleRecapitoEffettivo}
            Id_Recapito_Effettivo={this.Id_Recapito_Effettivo}
            utente={this.utente}
            OnGoToCarrello={this.handleGoToCarrello}/>  
          </>
        );
      }
      default: {
        return (
          <>
            <h3>Errore caricamento pagina</h3>
          </>
        );
        
      }
    }
  }
  
}

export default App;
