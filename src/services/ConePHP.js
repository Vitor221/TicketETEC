import axios from 'axios';

// ...
export default {
  data() {
    return {
      db: []
      };
    },
    mounted() {
        this.DadosPHP();
    },
    methods: {
        DadosPHP() {
        axios.get('http://localhost/Api-php/index.php')
            .then(response => {
            this.db = response.data;
            // Aqui você pode usar os dados recebidos como desejar
            })
            .catch(error => {
            console.error(error);
            });
        }
    }

};

