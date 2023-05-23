<template>
  <ion-page>

    <ion-col>
      <img src="./assets/etec-logo.svg" alt="">
    </ion-col>

    <ion-col>
        <form class="form-container">
          <h1>Login</h1>

          <ion-label class="label">RM</ion-label>
          <ion-col>  
            <ion-input class="input" :clear-input="true" type="text" v-model="form.rm"/>
          </ion-col>

          <ion-label class="label">Senha</ion-label>
          <ion-col>
            <ion-input class="input" :clear-input="true" type="password" v-model="form.senha"/>
          </ion-col>
        </form>
    </ion-col>

    <ion-button class="button" type="submit" @click="enviarLogin()">Entrar</ion-button>
  </ion-page>
</template>

<script>
import { IonPage, IonToolbar, IonTitle, IonButtons, IonButton, IonInput, IonCol } from '@ionic/vue';
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
    IonCol
  },
  data: () => ({
    form: {
      rm: '',
      senha: ''
    },
  }),
  mounted() {
    axios.get('http://localhost:3000/api/contas')
    .then(response => {
      this.form = response.data
    })
    .catch(error => {
      console.log(error);
    })
  }
  
})
</script>

<style scoped>
.form {
  display: flex;
  height: 100%;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  padding-bottom: 50%;
}

.form-container {
  width: 40%;
  margin: auto;
}

h1 {
  text-align: end;
  margin-bottom: 2rem;
}

/* .label {
  margin-left: 1rem;
} */

.input {
  margin-bottom: 2rem;
  border: 2px solid red;
  padding: 0;
  height: 0;
}

.button {
  width: auto;
  margin: auto;
  margin-top: auto;
  margin-bottom: 10%;
}

</style>