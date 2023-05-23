<template>
  <ion-page>
    <ion-header>
      <ion-toolbar>
        <ion-title>
          Página de Login
        </ion-title>
      </ion-toolbar>
    </ion-header>
  </ion-page>
</template>

<script>
import { IonPage, IonHeader, IonToolbar, IonTitle } from '@ionic/vue';
import { defineComponent } from 'vue';

export default defineComponent ({
  name: 'Login',
  components: {
    IonPage,
    IonHeader,
    IonToolbar,
    IonTitle
  }
})
</script>

<style>

</style>