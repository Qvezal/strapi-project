import axios from 'axios';
import { NextResponse } from 'next/server'

export async function POST(request: Request) {
  const req = await request.json();
  const url = req.url

  const api_request = `${process.env.NEXT_PUBLIC_API_URL || 'http://localhost:1337'}/api/${url}`;

  const response = {}

  return NextResponse.json(response, {status: 200});
}