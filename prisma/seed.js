import { PrismaClient } from '@prisma/client';
import { $fetch } from 'ofetch';

const prisma = new PrismaClient();
const productsURL = 'https://fakestoreapi.com/products';
const products = await $fetch(productsURL);

const seedProducts = async () => {
  try {
    for (const product of products) {
      await prisma.products.create({
        data: {
          title: product.title,
          description: product.description,
          image: product.image,
          category: product.category,
          price: product.price,
          rating_rate: product.rating.rate,
          rating_count: product.rating.count,
        },
      });
    }
  } catch (err) {
    console.error(err);
  } finally {
    await prisma.$disconnect();
  }
};

seedProducts();
