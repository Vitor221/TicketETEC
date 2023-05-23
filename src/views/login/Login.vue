<template>
  <ion-page>
    <div class="form">
      <div class="form-container">
        <form>
          <h1>Login</h1>

          <ion-item>
            <ion-label>RM</ion-label>
            <ion-input type="text" v-model="form.rm"/>
          </ion-item>

          <ion-item>
            <ion-label>Senha</ion-label>
            <ion-input type="password" v-model="form.senha"/>
          </ion-item>

        </form>
      </div>

      <ion-button class="button" type="submit" @click="enviarLogin()">Entrar</ion-button>
    </div>
    
  </ion-page>
</template>

<script>
import { IonPage, IonToolbar, IonTitle, IonButtons, IonButton, IonInput } from '@ionic/vue';
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
    IonInput
  },
  data: () => ({
    form: {
      rm: '',
      senha: ''
    },
    dados: []
  }),
  methods: {
    enviarLogin() {
      console.log(this.form)
    }
  },
  mounted() {
    axios.get('http://localhost:3000/api/contas')
    .then(response => {
      this.dados = response.data
      console.log(response.data)
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
  padding-bottom: 20px;
}

.form-container {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.button {
  margin-top: auto;
}

</style>