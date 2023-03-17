import { Component } from 'react';


class CardAcquisto extends Component {

    render(){

 
        return(

            <>
               <div className='row m-3'>
                    <div className='col'>
                   
                        <p className="card-title">
                            Codice Ordine: {this.props.ordini.Id_Acquisto}
                            <br/>volumi totali acquistati: {this.props.ordini.qtot}
                            <br/>Data ordine: {this.props.ordini.dataacquisto}
                            <br/>Prezzo ordine: {this.props.ordini.ptot}€
                            </p>
                            
                    </div>
                    <div className='col'>   
                        <button onClick={() => this.props.OnGoToVisualizzaOrdine(this.props.ordini)}className="btn btn-light  m-2">
                                            Visualizza Ordine
                        </button>
                    </div>
                    <hr />
                </div>

                   
           
                
            </>
        );
    }

}

export default CardAcquisto;