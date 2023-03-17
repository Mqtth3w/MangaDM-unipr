import { Component } from 'react';
import Prodotto from './prodotto';

class Serie extends Component {



    serie = {
        prodotto: [
          //{Id_Prodotto: 1, Id_Serie: 100, nome: "Demon Slayer", nvol: 1, stato: "disponibile", quantita: 20, datapubblicazione: "2019-04-10", descrizione: "Descrizione1", src_image: demon},
        ]
    }

    buttonLoad = {state: "visible" }

    handleAddMoreVolumes = btn =>{
        var addvol = {"Id_Serie": this.props.serie.Id_Serie, num: this.serie.prodotto.length};
        //Aggiunge altri 10 volumi alla visualizzazione
        fetch('http://127.0.0.1:5555/addMoreVolumes', {
            method: 'POST',
            body: JSON.stringify(addvol),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            },
        })
        .then(res => res.json())
        .then((data) => {
            for(var i = 0; i< data.length; i++){
                this.serie.prodotto.push(data[i]);
            }
            const serie = this.serie;
            this.setState({serie});
            if(this.props.serie.volumitotali === this.serie.prodotto.length){
                //Nascondi il pulsante carica altro
                this.buttonLoad.state = "hidden";
                const buttonLoad = this.buttonLoad;
                this.setState({buttonLoad});
                return;
            }
        })
        .catch((err) => {
            console.log(err.message);
        });
        
    }

    control = 0;
    componentDidMount() {
        if(this.control === 0){
            this.handleAddMoreVolumes();
            this.control = 1;
            const control = this.control;
            this.setState({control});
        }
        
    }


    render(){

        return(
            <>

                {this.serie.prodotto.map(prodotto => (
                    <Prodotto 
                    serie={this.props.serie}
                    key={prodotto.Id_Prodotto}
                    prodotto={prodotto}
                    OnCarrello={this.props.OnCarrello}
                    OnGoToSerie={this.props.OnGoToSerie}
                    />
                ))} 
                <div className="d-grid gap-2 col-6 mx-auto">
                    <button onClick={() => this.handleAddMoreVolumes()} className="btn btn-secondary m-2"  style={{visibility : this.buttonLoad.state}}>
                        Carica altro 
                    </button>
                </div>
            </>
        );
    } 
}

export default Serie;