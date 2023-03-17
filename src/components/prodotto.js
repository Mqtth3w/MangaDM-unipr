import { Component } from 'react';

class Prodotto extends Component {

    render(){
        const image = "http://localhost/" + this.props.prodotto.src_image;
        return( 
            <>
                <hr />
                <div className="card mb-3 m-3" style={{"width": "50rem"}}>
                    <div className="row g-0">
                        <div className="col-md-4">
                        <button onClick={() => this.props.OnGoToSerie()} className="btn btn-link" style={{textAlign : "left"}}>
                            volume {this.props.prodotto.nvol} di {this.props.serie.volumitotali}
                        </button>
                            <img src={image}  style={{"width": "10.5rem"}} className="img-fluid rounded-start" alt="..." />
                        </div>
                        <div className="col-md-8">
                            <div className="card-body">
                                <h5 className="card-title">{this.props.prodotto.nome} vol {this.props.prodotto.nvol}</h5>
                                <p className="card-text">{this.props.prodotto.descrizione}</p>
                                <p className="card-text">{this.props.prodotto.datapubblicazione}</p>
                                <p className="card-text">{this.props.prodotto.prezzo}€</p>
                            </div>
                            <button onClick={() => this.props.OnCarrello(this.props.prodotto)} className={this.props.prodotto.stato === "disponibile" ? "btn btn-primary m-2" : "btn m-2"}>
                                {this.props.prodotto.stato === "disponibile" ? "Aggiugi al carrello" : "Prodotto non disponibile"}
                            </button>
                        </div>
                    </div>
                </div>
            
            </>
        );
    }

}

export default Prodotto;