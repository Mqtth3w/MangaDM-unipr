
import { Component } from 'react';
import demon from '../images/demon-slayer-1.jpg'
import CardHome from './cardhome';
import banner from '../images/banner.jpg'

class HomePage extends Component {

  ultime_uscite = {
    prodotto: [
      {Id_Prodotto: 1, Id_serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantita: 20, datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon, prezzo: 5.10},
      {Id_Prodotto: 2, Id_serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantita: 20, datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon, prezzo: 5.10},
      {Id_Prodotto: 3, Id_serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantita: 20, datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon, prezzo: 5.10},
      {Id_Prodotto: 4, Id_serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantita: 20, datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon, prezzo: 5.10},
      {Id_Prodotto: 5, Id_serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantita: 20, datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon, prezzo: 5.10},
    ]
  }
  most_seller = {
    prodotto: [
      {Id_Prodotto: 6, Id_serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantita: 20, datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon, prezzo: 5.10},
      {Id_Prodotto: 7, Id_serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantita: 20, datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon, prezzo: 5.10},
      {Id_Prodotto: 8, Id_serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantita: 20, datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon, prezzo: 5.10},
      {Id_Prodotto: 9, Id_serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantita: 20, datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon, prezzo: 5.10},
      {Id_Prodotto: 10, Id_serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantita: 20, datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon, prezzo: 5.10},
    ]
  }


  componentDidMount() {
    var get5ultime_uscite = {opzione: 'ultimeuscite'};
    var get5most_seller = {opzione: 'mostseller'};

    
    //ULTIME USCITE
    fetch('http://127.0.0.1:5555/prodotti/:get5prodotti', {
      method: 'POST',
      body: JSON.stringify(get5ultime_uscite),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      })
      .then(res => res.json())
      .then((data) => {
        //alert(data.length);
        /*for(var i = 0; i < data.length; i++){
          this.ultime_uscite.prodotto[i] = data[i];
        }*/
        this.ultime_uscite.prodotto = data;
        const ultime_uscite = this.ultime_uscite;
        this.setState({ultime_uscite});
      })
      .catch((err) => {
        console.log(err.message);
      });

      //MOST SELLER
      fetch('http://127.0.0.1:5555/prodotti/:get5prodotti', {
      method: 'POST',
      body: JSON.stringify(get5most_seller),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      })
      .then(res => res.json())
      .then((data) => {
        this.most_seller.prodotto = data;
        const most_seller = this.most_seller;
        this.setState({most_seller});
      })
      .catch((err) => {
        console.log(err.message);
      });
  }
  

  
    
    render(){
        return (
            <>
              <div className='container'>
                <h2>Home Page   {this.props.utente.Id_Utente === -1 ? "" : ",    Bentornato " + this.props.utente.nome}</h2>
                <img src={banner} className="card-img-top" alt="" style={{"width": "70rem"}}/>
                <hr />
                <h2>Ultime Uscite</h2>
                <div className='row'>
                  {this.ultime_uscite.prodotto.map(prodotto => (
                    <CardHome 
                    key={prodotto.Id_Prodotto}
                    prodotto={prodotto}
                    OnCarrello={this.props.OnCarrello}
                    OnGoToProdotto={this.props.OnGoToProdotto}/>
                  ))}
                </div>
                <hr />
                <h2>I più venduti</h2>
                <div className='row'>
                  {this.most_seller.prodotto.map(prodotto => (
                    <CardHome 
                    key={prodotto.Id_Prodotto}
                    prodotto={prodotto}
                    OnCarrello={this.props.OnCarrello}
                    OnGoToProdotto={this.props.OnGoToProdotto}/>
                  ))}
                </div>
              </div>
            </>
          );
    }
    


}

export default HomePage;