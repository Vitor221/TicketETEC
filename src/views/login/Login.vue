<template>
  <ion-page>
    <div class="form row">
      <div class="form-container">
        <form>
          <h1>Entrar</h1>
          <ion-item>
            <ion-input label="E-mail" type="text" v-model="form.email" required></ion-input>
          </ion-item>
          <ion-item>
            <ion-input label="Senha" type="password"  v-model="form.senha" required></ion-input>
          </ion-item>
          <ion-button expand="full"  type="submit" @click="enviarLogin()">Entrar</ion-button>
        </form>
        
      </div>
    </div>
  </ion-page>
</template>

<script>
import { IonPage, IonToolbar, IonTitle, IonContent, IonButtons, IonButton, IonInput, IonItem } from '@ionic/vue';
import { defineComponent } from 'vue';
import axios from 'axios';

export default defineComponent ({
  name: 'Login',
  components: {
    IonPage,
    IonToolbar,
    IonTitle,
    IonButtons,
    IonButton,
    IonInput,
    IonItem,
    IonContent
  },
  data() {
    return {
      form: {
      email: '',
      senha: ''
    },
    db: []
    }
  },
  mounted() {
        this.DadosPHP();
        window.history.replaceState({}, document.title, window.location.pathname);
    },
  methods: {
    enviarLogin() {
      
    },
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
   
  },
  
  
})
</script>

<style scoped>
.form {
  padding-top: 100px;
  display: flex;
  height: 100%;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
}
.form-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
ion-button {
  padding-top: 10px;
  
}

h1 {
  text-align: center;
  padding-bottom: 10px;
}


</style>