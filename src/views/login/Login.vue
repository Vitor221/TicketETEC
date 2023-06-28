<template>
  <ion-page>
    <div class="form">
      <div class="form-container">
        <form @submit.prevent>
          <h1>Login</h1>
          <h3 style="color: #ff7373; font-weight: 700" v-text="validacao"></h3>

          <ion-item>
            <ion-label>E-mail</ion-label>
            <ion-input type="text" v-model="form.email"/>
          </ion-item>

          <ion-item>
            <ion-label>Senha</ion-label>
            <ion-input type="password" v-model="form.senha"/>
          </ion-item>

          <ion-button class="button" type="submit" @click="enviarLogin()" style="margin-top: 10%">Entrar</ion-button>
        </form>
      </div>


    </div>
    
  </ion-page>
</template>

<script>
import { IonPage, IonToolbar, IonTitle, IonButtons, IonButton, IonInput } from '@ionic/vue';
import { defineComponent } from 'vue';
import axios from 'axios';
import {useRouter} from "vue-router";

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
      email: '',
      senha: '',
    },
    dados: [],
    validacao: '',
  }),
  methods: {
    enviarLogin() {
      if(this.form.email.trim() === '' || this.form.email.trim() === '') {
        this.validacao = 'Preencha todos os campos'
        setTimeout(() => {
          this.validacao = ''
        }, 5000)
        return;
      }
      axios.post('http://localhost:3000/api/login', this.form)
          .then(response => {
            if (response.data.success) {
              const tipoUsuario = response.data.tipoUsuario;

              if (tipoUsuario === 'atendente') {
                this.$router.push('/atendente/tab1');
              } else if (tipoUsuario === 'integrante') {
                this.$router.push('/cliente/tab1');
              } else {
                console.log('Tipo de usuário inválido');
              }
            } else {
              this.validacao = 'Email ou senha inválidas';
              setTimeout(() => {
                this.validacao = '';
              }, 5000)
            }
          })
          .catch(error => {
            console.log(error);
          });
    }
  },
  mounted() {
    axios.post('http://localhost:3000/api/login')
    .then(response => {
      this.dados = response.data
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