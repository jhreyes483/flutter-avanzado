const Band = require("./band");

class Bands {

    constructor(){
        this.bands = [];    
    }

    addBand(band = new Band){
        this.bands.push(band);
    }

    getBands(){
        return this.bands;
    }

    deleteBand(id = ''){
        console.log('id delete', id)
        this.bands = this.bands.filter(band => band.id !== id);
        console.log('new bans ', this.bands)
        return this.bands;
    }

    voteBand(id = ''){
        this.bands = this.bands.map(band => {
            if(band.id === id){
                band.votes++;
                return band;
            }else{
                return band
            }
        })
    }
}

module.exports = Bands;