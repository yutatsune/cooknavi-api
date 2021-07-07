<template>
  <div class="container">
    <div>
      <h1 class="title">
        COOKNAVI
      </h1>
      <h2 class="subtitle">
        {{ subTitle }}
      </h2>
      <button @click="getSomething">
        タスク取得
      </button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      subTitle: 'MAKE YOUR FOOD HAPPY!!'
    }
  },
  methods: {
    getSomething() {
      alert('Get Something!!')
    }
  },
}
</script>